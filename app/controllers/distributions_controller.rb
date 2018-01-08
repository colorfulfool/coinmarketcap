class DistributionsController < ApplicationController
  def new
    @coins = Coin.where(marked: true)
  end
end
