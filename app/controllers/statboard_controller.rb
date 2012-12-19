class StatboardController < ApplicationController
  def index
    @players = Player.order('rating DESC')
  end
end
