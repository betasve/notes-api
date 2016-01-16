class Tag < ActiveRecord::Base
  include PgSearch

  # Validations
  validates :name, presence: true

  # Relations
  has_and_belongs_to_many :notes

  # Search index setup
  multisearchable :against => [:name]


  def self.get_collection(tags)
    persisted_tags = []
    tags.each do |tag|
      persisted_tags << Tag.find_or_create_by(name: tag[:attributes][:name])
    end
    persisted_tags
  end

end
