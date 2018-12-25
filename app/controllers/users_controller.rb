class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i(edit update destroy)

  def show
    @songs = current_user.songs.page(params[:page]).per Settings.per_page
    @playlists = current_user.playlists.page(params[:page]).per Settings.per_page
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
