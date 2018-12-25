class PlaylistSongsController < ApplicationController
  def create
    @playlists = current_user.playlists

    if params["playlist_song"].present?
      @playlist = Playlist.find_by name: params["playlist_song"]["playlist_id"],
        user_id: params[:user_id]
    else
      @playlist = Playlist.find_by name: params[:playlist_id],
        user_id: params[:user_id]
    end
    @song = Song.find_by id: params[:song_id]
    @playlist_song = PlaylistSong.new playlist_id: @playlist.id,
      song_id: @song.id

    if @playlist_song.save
      respond_to do |format|
        format.js{flash.now[:notice] = t ".success"}
      end
    else
      respond_to do |format|
        format.js{flash.now[:notice] = t ".failed"}
      end
    end
  end

  def destroy
    @playlist_song = PlaylistSong.find_by playlist_id: params[:id],
      song_id: params[:song_id]

    if @playlist_song.destroy
      flash[:success] = t ".destroy"
    else
      flash[:danger] = t ".cant_destroy"
    end
    redirect_to request.referrer || root_url
  end
end
