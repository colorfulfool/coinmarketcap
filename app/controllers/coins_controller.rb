class CoinsController < ApplicationController
  before_action :default_params
  
  def index
    @coins = Coin.where('marketcap > 0 and supply > 0').order('marketcap desc')
    @coins = @coins.where("marketcap < #{params[:marketcap]}*1000000 and supply < #{params[:supply]}*1000000 and price < #{params[:price]}")
  end
  
  def mark
    @coin = Coin.find(params[:id])
    @coin.update marked: !@coin.marked
  end
  
  def erase_markings
    Coin.where(marked: true).update_all(marked: false)
    redirect_to root_path
  end
  
  private
  
    def default_params
      params[:marketcap] ||= 500
      params[:supply] ||= 200
      params[:price] ||= 0.7
    end
end
