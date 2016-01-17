class NotesSerializer < BaseSerializer

  private

  def serialize_many(resources)
    result = {}
    result[:links] = { self: api_v1_notes_url }
    result[:data] = add_records(@resources)
    result
  end

  def serialize_one(resource)
    result = {}
    result[:links] = { self: api_v1_note_url(resource) }
    result[:data] = add_single_record
    result[:relationships] = get_related_tags(resource)
    result
  end

  def get_related_tags(note)
    {
      tags: {
        links: {
          related: api_v1_note_tags_url(note)
        },
        data: self.to_collection(note.tags)
      }
    }
  end
end
