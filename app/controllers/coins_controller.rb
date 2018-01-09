class CoinsController < ApplicationController
  before_action :default_params
  
  def index
    @coins = Coin.where('marketcap > 0 and supply > 0').order('marketcap desc')
    @coins = @coins.where("marketcap < #{params[:marketcap]}*1000000 and supply < #{params[:supply]}*1000000 and price < #{params[:price]}")
  end
  
  def mark
    @coin = Coin.find(params[:id])
    if @coin.in? selected_coins
      set_selected_coins selected_coins.where.not(id: @coin)
    else
      set_selected_coins selected_coins + [@coin]
    end
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
    
    def selected_coins
      Coin.where id: session[:selected_coins]&.split(",")
    end
    
    def set_selected_coins coins
      session[:selected_coins] = coins.collect(&:id).join(",")
    end
    
    helper_method :selected_coins
end
