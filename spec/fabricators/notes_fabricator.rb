Fabricator(:note) do
    title       { Faker::Lorem.sentence }
    body        { Faker::Lorem.paragraph }
end
