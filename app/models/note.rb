class Note < ActiveRecord::Base

  validates :title, presence: true

  has_and_belongs_to_many :tags

end
