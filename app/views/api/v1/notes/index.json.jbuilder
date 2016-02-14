json.links do
  json.self api_v1_notes_url
end

json.data @notes do |note|
  json.partial! 'note', note: note
end
