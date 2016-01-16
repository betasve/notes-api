module ControllerHelpers
  def set_content_type
    request.headers['Content-Type'] = 'application/json'
  end

  def json
    @json ||= JSON.parse(response.body, symbolize_names: true)
  end

  def update_request(note)
    note_hash = NotesSerializer.new(note).to_json
    {
      :id => note.id,
      :data => note_hash.fetch(:data),
      :relationships => note_hash.fetch(:relationships)
    }
  end
end
