class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  enum role: {admin: 1, member: 0}

  has_many :songs, dependent: :destroy
  has_many :playlists, dependent: :destroy
  has_many :comments
  has_many :liked, as: :likeable

  validates :name, presence: true,
    length: {maximum: Settings.user.name.length}
  validates :email, presence: true,
    length: {maximum: Settings.user.email.length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: Settings.user.case_sensitive}
  validates :password, presence: true,
    length: {minimum: Settings.user.password.length},
    allow_nil: true

  before_save :downcase_email

  private

  def downcase_email
    email.downcase!
  end
end
