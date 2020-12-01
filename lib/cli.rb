require_relative '../config/environment.rb'
require_relative './formattable.rb'

class Cli
    include Formattable::AddCommas

    def run
        welcome_user
    end

    def welcome_user
        Country.create_from_scraper
        global_stats = Country.find_global_stats
        tot_cases = add_commas_to_int("#{global_stats.cases}")
        tot_deaths = add_commas_to_int("#{global_stats.deaths}")
        tot_recovered = add_commas_to_int("#{global_stats.recovered}")
        puts ""
        puts "--------------------------------"
        puts "Welcome to COVID-19 Stats Check!"
        puts "--------------------------------"
        puts ""
        puts "TOTAL CASES | #{tot_cases}"
        puts ""
        puts "TOTAL DEATHS | #{tot_deaths}"
        puts ""
        puts "TOTAL RECOVERED | #{tot_recovered}"
        puts ""
        
    end


end

