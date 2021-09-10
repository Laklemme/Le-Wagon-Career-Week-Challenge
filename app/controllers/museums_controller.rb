require 'json'
require 'open-uri'

class MuseumsController < ApplicationController
  def index
    if params[:query1].present? && params[:query2].present?
      @museum_list = Museum.new
      url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?lat=#{params[:query1]}&lng=#{params[:query2]}&access_token=#{ENV['MAPBOX_API_KEY']}"
      raw_data = URI.open(url).read
      @museums = JSON.parse(raw_data)
      @response = {}
      @museums['features'].each { |museum| @response[museum['context'][0]['text']] = [museum['text']] }
    else
      @museum_list = Museum.new
    end
  end
end
