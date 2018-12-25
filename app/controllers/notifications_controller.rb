class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: %i(index show)

  def index
    @notifications = current_user.notifications.ordered
                                 .page(params[:page]).per Settings.nofi
  end
end
