require_relative '../config/environment.rb'

class Cli


    def self.start
        Cli.new
        Country.create_from_scraper
        global_stats = Country.find_global_stats 
        puts "Welcome to COVID-19 Stats Check!"
        "Global Coronavirus Cases: #{global_stats.cases}"

    end

binding.pry
end