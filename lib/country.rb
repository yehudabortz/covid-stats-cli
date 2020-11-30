require_relative '../config/environment.rb'

class Country
    @@all = []

    def initialize(attributes)
        attributes.each do |key, value| 
          self.class.attr_accessor(key)
          self.send(("#{key}="), value)
        end
        @@all << self
    end

    def self.all
        @@all
    end


    def self.create_from_scraper
        covid_data = Scraper.create_and_parse
        covid_data.each do |country|
            self.new(country)
        end
    end

    def self.find_global_stats
        self.all.find {|c| c.country == "World"}
    end
    binding.pry

end