class MusicCommentsController < ApplicationController
	def create
	    music = Music.find(params[:music_id])
	    comment = current_user.music_comments.new(music_comment_params)
	    comment.music_id = music.id
	    comment.save
	    redirect_to music_path(music)
	end
	def destroy
	    comment = MusicComment.find(params[:music_id])
	    music = comment.music
	    comment.destroy
	    redirect_to music_path(music)
    end
	private
	def music_comment_params
	    params.require(:music_comment).permit(:user_id,:music_id,:comment)
	end
end
