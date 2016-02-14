json.links do
  json.self api_v1_tag_url @tag
end

json.data do
  json.partial! 'tag', tag: @tag
end

json.relationships do
  json.notes do
    json.links do
      json.related api_v1_tag_notes_url(@tag)
    end

    json.data @tag.notes do |note|
      json.partial! 'api/v1/notes/note', note: note
    end
  end
end
