class NotesSerializer
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

  private

  def serialize_many(resources)
    result = {}
    result[:links] = { self: api_v1_notes_url }
    result[:data] = add_records
    result
  end

  def serialize_one(resource)
    result = {}
    result[:links] = { self: api_v1_note_url(resource) }
    result[:data] = add_single_record
    result[:relationships] = get_related_tags(resource.id)
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
      type: 'notes',
      id:    res_hash.delete("id"),
      attributes: res_hash
    }
  end

  def get_related_tags(note_id)
    {
      tags: {
        links: {
          related: api_v1_note_tags_url(note_id)
        }
      }
    }
  end
end
