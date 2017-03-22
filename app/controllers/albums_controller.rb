class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :new, :update, :destroy]

  def index
    @albums = Album.all
    if params[:search].nil?
      @albums = Album.all.order(year: :desc).order(title: :asc).paginate(:page => params[:page], :per_page => 24)
    else
      @albums = @albums.where("LOWER(albums.title) || LOWER(albums.year) || LOWER(albums.artist) LIKE ?", "%#{params[:search].downcase}%").order(year: :desc).order(title: :asc).paginate(:page => params[:page], :per_page => 24)
    end
  end

  def show
    if @album.reviews.blank?
      @average_review = 0
    else
      @average_review = @album.reviews.average(:rating).round(2)
    end
    @review = Review.new
  end

  def new
    @album = Album.new
  end

  def edit

  end

  def create
    @album = current_user.albums.build(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :artist, :year, :cover)
    end
end
