class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: %i(index show)

  def index
    @notifications = current_user.notifications.ordered
<<<<<<< HEAD
                                 .page(params[:page]).per Settings.per_page
=======
                                 .page(params[:page]).per Settings.nofi
>>>>>>> 0926769c849f706162a542509d54adfbc7235773
  end
end
