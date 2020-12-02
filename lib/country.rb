class CovidStatsCli::Country
    
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
        covid_data = CovidStatsCli::Scraper.create_and_parse
        covid_data.each do |country|
            self.new(country)
        end
    end

    def self.find_stats(input)
        self.all.find {|c| c.country == input}
    end

    def self.exclude_world_stats
        self.all.select {|c| c.country != "World"}
    end

    def self.list_countries
        self.exclude_world_stats.collect {|c| c.country}.sort
    end

    def self.find_from_input(input)
        self.find_stats(list_countries[input.to_i - 1])
    end

end