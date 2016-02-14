json.links do
  json.self api_v1_note_url @note
end

json.data do
  json.partial! 'note', note: @note
end

json.relationships do
  json.tags do
    json.links do
      json.related api_v1_note_tags_url(@note)
    end

    json.data @note.tags do |tag|
      json.partial! 'api/v1/tags/tag', tag: tag
    end
  end
end
