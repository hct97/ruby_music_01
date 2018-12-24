class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :user_noti, ->(song_id){where("notifiable_id = '#{song_id}'")}
end
