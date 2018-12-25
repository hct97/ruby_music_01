class SongsController < ApplicationController
  before_action :find_song, only: %i(show edit update destroy)
  before_action :support, only: :show
  before_action :authenticate_user!, only: %i(new create)
  after_action :increase_view, only: :show

  def index
    if params[:search]
      @songs = Song.search_by_full_name(params[:search]).hot_feed
                   .page(params[:page]).per Settings.pages.per_page
    else
      @songs = Song.page(params[:page]).hot_feed.per Settings.pages.per_page
    end
    @list_songs = Song.first Settings.list_song
  end

  def new
    @song = current_user.songs.new
    @song.build_singer
  end

  def create
    @song = current_user.songs.build song_params

    if @song.save
      flash[:success] = t ".success"
      redirect_to @song
    else
      flash[:danger] = t ".failed"
      render :new
    end
  end

  def edit
    if @song.singer.present?
      @song.singer.name = ""
      @song.singer.description = ""
    end
  end

  def update
    if @song.update song_params
      flash[:success] = t ".success"
      redirect_to @song
    else
      flash[:danger] = t ".failed"
      render :edit
    end
  end

  def destroy
    if @song.comments.destroy_all && @song.playlist_songs.destroy_all &&
      @song.genre_songs.destroy_all && @song.delete
      flash[:success] = t ".success"
    else
      flash[:danger] = t "failed"
    end
    redirect_to request.referrer || root_url
  end

  def show
    @comment = current_user.comments.build if user_signed_in?
    @playlists = current_user.playlists.order_desc if current_user
                                                     &.playlists&.any?
  end

  private

  def song_params
    params.require(:song).permit Song::SONG_ATTRIBUTES
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def find_song
    @song = Song.include_to_song.find_by id: params[:id]
    redirect_to songs_url unless @song
  end

  def support
    @supports ||= Supports::SongSupport.new @song, current_user, params[:page]
  end

  def increase_view
    @song.increment! :view
    @song.save
  end
end
