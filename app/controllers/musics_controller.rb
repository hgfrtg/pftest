class MusicsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show, :about]
  before_action :set_music, only: [:show, :edit, :update, :destroy]

  # GET /musics
  # GET /musics.json
  def index
    @musics = Music.order("created_at DESC").page(params[:page])
    if Rails.env.production?
    # 本番コード
    @randmusics = Music.order("RAND()").limit(5)
    else 
    # 開発環境コード
    @randmusics = Music.order("RANDOM()").limit(5)
    end
  end

  # GET /musics/1
  # GET /musics/1.json
  def show
    @user = @music.user
    @music_comment = MusicComment.new
  end

  def about
  end

  # GET /musics/new
  def new
    @music = Music.new
  end

  # GET /musics/1/edit
  def edit
    if current_user.id != @music.user_id
       redirect_to musics_path
    end
  end

  # POST /musics
  # POST /musics.json
  def create
    @music = Music.new(music_params)
    @music.user_id = current_user.id

    respond_to do |format|
      if @music.save
        format.html { redirect_to @music, notice: 'Music was successfully created.' }
        format.json { render :show, status: :created, location: @music }
      else
        format.html { render :new }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /musics/1
  # PATCH/PUT /musics/1.json
  def update
    respond_to do |format|
      if @music.update(music_params)
        format.html { redirect_to @music, notice: 'Music was successfully updated.' }
        format.json { render :show, status: :ok, location: @music }
      else
        format.html { render :edit }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musics/1
  # DELETE /musics/1.json
  def destroy
    @music.destroy
    respond_to do |format|
      format.html { redirect_to musics_url, notice: 'Music was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music
      @music = Music.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def music_params
      params.require(:music).permit(:title, :audio, :description, :jacket_image)
    end
end
