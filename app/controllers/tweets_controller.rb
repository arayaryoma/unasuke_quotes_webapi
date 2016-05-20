class TweetsController < ApplicationController
  def show
    render json: Unasuke.where('id >= ?', rand(Unasuke.first.id..Unasuke.last.id)).first
  end
end
