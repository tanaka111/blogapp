class TweetsController < ApplicationController

  def index
    @tweets = Tweet.order("id DESC").page(params[:page]).per(5)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(text: tweet_params[:text],name: tweet_params[:name], user_id: current_user.id)
    redirect_to action: :index
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to action: :index
  end


  def show
    @tweet = Tweet.find(params[:id])
  end

   private
   def tweet_params
     params.require(:tweet).permit(:text,:name)
   end

end
