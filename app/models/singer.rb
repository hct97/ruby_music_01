class Singer < ApplicationRecord
  has_many :songs, dependent: :destroy

  validates :name, presence: true, uniqueness: true,
    length: {maximum: Settings.title.max_length}
  validates :description, length: {maximum: Settings.content.max_length}
end
