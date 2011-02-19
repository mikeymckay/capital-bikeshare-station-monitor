require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'couchrest'

current_time = Time.now.to_i

CouchRest.database!("http://mikeymckay.couchone.com/capital-bikeshare").bulk_save(
  Nokogiri::XML(open('http://www.capitalbikeshare.com/stations/bikeStations.xml')).css("stations station name").map{|station|
    ["id","nbBikes","nbEmptyDocks"].inject({:timestamp => current_time}) do |result, property|
      result[property] = station.parent.css(property).first.content
      result
    end
  }
)
