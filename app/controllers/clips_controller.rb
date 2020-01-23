class ClipsController < ApplicationController

  def index
    @user = current_user
    @clips = Clip.where(user_id: @user.id).page(params[:page])
  end

  def create
    @music = Music.find(params[:music_id])
    clip = @music.clips.new(user_id: current_user.id)
      if clip.save
        redirect_back fallback_location: @music
      end
  end

  def destroy
  	@music = Music.find(params[:music_id])
    clip = current_user.clips.find_by(music_id: @music.id)
    if clip.destroy
      redirect_back fallback_location: @music
    end
  end

end