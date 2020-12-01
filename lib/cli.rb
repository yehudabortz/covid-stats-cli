require_relative '../config/environment.rb'

class Cli
    
    def run
        welcome_user
    end

    def welcome_user
        Country.create_from_scraper
        puts ""
        puts "--------------------------------"
        puts "Welcome to COVID-19 Stats Check!"
        puts "--------------------------------"
        global_stats = Country.find_global_stats
        puts ""
        puts "TOTAL CASES | #{global_stats.cases}"
        puts ""
        puts "TOTAL DEATHS | #{global_stats.deaths}"
        puts ""
        puts "TOTAL RECOVERED | #{global_stats.recovered}"
        puts ""
        
    end

end

