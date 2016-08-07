class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
  
  def index
    @tweets = Tweet.all
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end
  
  def new
#    if params[:back]
#      @tweet = Tweet.new(tweets_params)
#    else
#      @tweet = Tweet.new
#    end
  end

  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  def create
    @tweet = Tweet.create(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice: "ツイートを作成しました！"
    else
      render action: 'new'
    end
  end
  
  def edit
#    @tweet = Tweet.find(params[:id])
  end
  
  def update
#    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweets_params)
      redirect_to tweets_path, notice: "ツイートを投稿(更新)しました！"
    else
      render action: 'edit'
    end
  end
  
  def destroy
#    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: "ツイートを削除しました！"
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
  
end
