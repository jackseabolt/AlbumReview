class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_album
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]



  def new
    @review = Review.new
  end

  def show
    
  end

  def create
    @review = Review.new(review_params)
    @review.album_id=@album.id
    @review.user_id=current_user.id
    if @review.save
        ActionCable.server.broadcast 'reviews' ,
        render( partial: 'reviews/review', object: @review )
    else
        render 'new'
    end
    redirect_to album_path(@album)
  end

  def edit

  end

  def update
    if @review.update(review_params)
      redirect_to album_path(@album)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    if @review.destroy
      redirect_to album_path(@album)
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end
    
    def set_album 
      @album = Album.find(params[:album_id])
    end 

    def review_params
      params.require(:review).permit(:comment, :user_id, :album_id, :rating)
    end
end
