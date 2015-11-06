class CongressController < ApplicationController
  require 'httparty'
  require 'json'

  def index
  end

  def show
    @zip_code = params[:zip_code]
    @response = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators/locate?zip=#{@zip_code}&apikey=#{ENV['SUNLIGHT_ACCOUNT_KEY']}")
    @parsed_response = JSON.parse(@response.body)
    @object = @parsed_response['results']
  end

end
