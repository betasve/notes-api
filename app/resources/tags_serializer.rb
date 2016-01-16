class TagsSerializer
  include Rails.application.routes.url_helpers

  def initialize(resources)
    @resources = resources
  end

  def to_json
    if @resources.respond_to?(:each)
      serialize_many(@resources)
    else
      serialize_one(@resources)
    end
  end

  def to_collection
    add_records
  end

  private

  def serialize_one(resource)
    result = {}
    result[:links] = { self: api_v1_tag_url(resource) }
    result[:data] = add_single_record
    result[:relationships] = get_related_notes(resource)
    result
  end

  def serialize_many(resources)
    result = {}
    result[:links] = { self: api_v1_tags_url }
    result[:data] = add_records
    result
  end

  def add_single_record
    record_to_hash(@resources)
  end

  def add_records
    data = []
    @resources.each do |resource|
      data << record_to_hash(resource)
    end
    data
  end

  def record_to_hash(record)
    res_hash = record.attributes
    {
      type: record.class.name.downcase.pluralize,
      id:    res_hash.delete("id"),
      attributes: res_hash.symbolize_keys
    }
  end

  def get_related_notes(tag)
    {
      notes: {
        links: {
          related: api_v1_tags_url
        },
        data: NotesSerializer.new(tag.notes).to_collection
      }
    }
  end
end
