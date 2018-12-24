class Liked < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  has_many :notifications, as: :notifiable

  validates_uniqueness_of :likeable_id, scope: [:user_id, :likeable_type]
end
