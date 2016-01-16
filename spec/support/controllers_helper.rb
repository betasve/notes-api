module ControllerHelpers
  def set_content_type
    request.headers['Content-Type'] = 'application/json'
  end

  def json
    @json ||= JSON.parse(response.body, symbolize_names: true)
  end

  def update_request(note)
    { :id => note.id, :data => NotesSerializer.new(note).to_json.fetch(:data) }
  end
end
