class Note < ActiveRecord::Base
  include PgSearch

  # Validations
  validates :title, presence: true

  # Relations
  has_and_belongs_to_many :tags

  # Search index setup
  multisearchable :against => [:title, :body, :tags]

end
