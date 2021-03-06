class PlaylistsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :correct_user, only: :destroy
  before_action :find_playlist, only: %i(edit show update)

  def index
    @playlist = current_user.playlists.build if logged_in?
    @playlist_items = current_user.playlists.order_desc.page params[:page]
  end

  def create
    @playlist = current_user.playlists.build playlist_params

    if @playlist.save
      flash[:success] = t ".playlist_created"
      redirect_to playlists_path
    else
      @playlist_items = []
      render "playlist/index"
    end
  end

  def show; end

  def edit; end

  def update
    if @playlist.update playlist_params
      flash[:success] = t ".playlist_updated"
      redirect_to playlists_path
    else
      flash[:danger] = t ".update_fail"
      render :edit
    end
  end

  def destroy
    if @playlist.destroy
      flash[:success] = t ".playlist_deleted"
      redirect_to request.referrer || root_url
    else
      flash[:danger] = ".delete_failed"
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit :name
  end

  def correct_user
    @playlist = current_user.playlists.find_by id: params[:id]
    redirect_to root_path unless @playlist
  end

  def find_playlist
    @playlist = Playlist.find_by id: params[:id]
  end
end
