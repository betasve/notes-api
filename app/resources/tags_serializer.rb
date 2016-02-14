class TagsSerializer < BaseSerializer

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
    result[:data] = add_records(@resources)
    result
  end

  def get_related_notes(tag)
    {
      notes: {
        links: {
          related: api_v1_tag_notes_url(tag)
        },
        data: self.to_collection(tag.notes)
      }
    }
  end
end
