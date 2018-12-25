module ApplicationHelper
  def show_notifications
    songs = current_user.songs.ids
    @notifications = []
    songs.each do |s|
      @notifications.concat(Notification.user_noti(s))
    end
    @notifications = @notifications.sort_by{|i| -i[:id]}.first(5)
  end
end
