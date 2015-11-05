class CongressController < ApplicationController
  require 'httparty'

  def index
  end

  def show
    @zip_code = params[:zip_code]
    @response = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators/locate?zip=#{@zip_code}&apikey=#{ENV['SUNLIGHT_ACCOUNT_KEY']}")
    @parsed_response = JSON.parse(@response.body)
  end

end
