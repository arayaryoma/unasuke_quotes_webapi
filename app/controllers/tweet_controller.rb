class TweetController < ApplicationController
  def show
    tweet = Unasuke.where('id >= ?', rand(Unasuke.count) + 1).first
    render json: tweet
  end
end
