class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs
  has_many :liked, as: :likeable

  scope :order_desc, ->{order created_at: :desc}

  validates :user_id, presence: true
  validates :name, presence: true, length: {maximum: Settings.length_name}
end
