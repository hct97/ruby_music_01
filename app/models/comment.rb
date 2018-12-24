class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :song
  has_many :notifications, as: :notifiable

  validates :content, presence: true,
    length: {maximum: Settings.content.max_length}
  validates :user_id, presence: true
  validates :song_id, presence: true

  after_create_commit :create_notification

  scope :ordered, ->{order created_at: :desc}

  private

  def create_notification
    Notification.create user_id: user_id, notifiable_id: song_id,
      notifiable_type: :Comment
  end
end
