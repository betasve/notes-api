json.links do
  json.self api_v1_tags_url
end

json.data @tags do |tag|
  json.partial! 'tag', tag: tag
end
