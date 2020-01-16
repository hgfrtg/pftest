class FavoritesController < ApplicationController
  def create
    @music = Music.find(params[:music_id])
    favorite = @music.favorites.new(user_id: current_user.id)
    favorite.save
    # redirect_back fallback_location: @music

      # respond_to do |format|
      # format.html { redirect_back fallback_location: @music }
      # format.js
    # end
  end

  def destroy
    @music = Music.find(params[:music_id])
    favorite = current_user.favorites.find_by(music_id: @music.id)
    favorite.destroy
    # redirect_back fallback_location: @music

      # respond_to do |format|
      # format.html { redirect_back fallback_location: @music }
      # format.js
    # end
  end
end
