json.type note.class.to_s.downcase.pluralize
json.id note.id
json.attributes note, :title, :body
