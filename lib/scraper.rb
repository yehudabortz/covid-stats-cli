require 'JSON'
require 'net/http'
require 'open-uri'
require 'pry'
require 'awesome_print'


class Scraper
    API = "https://coronavirus-19-api.herokuapp.com/countries"

    def get_response_body
        uri = URI.parse(API)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        parse_data = JSON.parse(get_response_body)
    end

    def self.create_and_parse
        self.new.parse_json
    end
# binding.pry
end