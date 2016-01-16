Fabricator(:note) do
    title  { Faker::Lorem.sentence }
    body   { Faker::Lorem.paragraph }
    tags(count: 3)
end
