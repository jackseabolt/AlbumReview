class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_album

  def new
    @review = Review.new
  end

  def show
    
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.album_id=@album.id
    @review.user_id=current_user.id
    if @review.save
        redirect_to album_path(@album)
    else
        render 'new'
    end
  end

  def edit
  end
  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    if @review.update(review_params)
      redirect_to album_path(@album)
    else
      render 'edit'
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    if @review.destroy
      redirect_to album_path(@album)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end
    def set_album 
      @album = Album.find(params[:album_id])
    end 
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:comment, :user_id, :album_id, :rating)
    end
end
