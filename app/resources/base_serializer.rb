class BaseSerializer
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

  def to_collection(records)
    add_records(records)
  end

  private

  def add_single_record
    record_to_hash(@resources)
  end

  def add_records(records)
    @records = records || @resources
    data = []
    @records.each do |resource|
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
end
