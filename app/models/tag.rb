class Tag < ActiveRecord::Base

  validates :name, presence: true

  has_and_belongs_to_many :notes

  def self.get_collection(tags)
    persisted_tags = []
    tags.each do |tag|
      persisted_tags << Tag.find_or_create_by(name: tag[:attributes][:name])
    end
    persisted_tags
  end

end
