require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'couchrest'

#database_uri = "http://mikeymckay.couchone.com/capital-bikeshare"
database_uri = "http://localhost:5984/test"

current_time = Time.now.to_i

CouchRest.database!(database_uri).bulk_save(
  Nokogiri::XML(open('http://www.capitalbikeshare.com/stations/bikeStations.xml')).css("stations station name").map{|station|
    ["id","nbBikes","nbEmptyDocks"].inject({:timestamp => current_time}) do |result, property|
      result[property] = station.parent.css(property).first.content
      result
    end
  }
)
