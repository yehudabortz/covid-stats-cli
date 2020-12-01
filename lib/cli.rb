require_relative '../config/environment.rb'
require_relative './formattable.rb'
require 'colorize'

class Cli
    include Formattable::AddCommas

    def run
        welcome_user
    end

    def welcome_user
        Country.create_from_scraper
        global_stats = Country.find_stats("World")
        tot_cases = add_commas_to_int("#{global_stats.cases}")
        tot_deaths = add_commas_to_int("#{global_stats.deaths}")
        tot_recovered = add_commas_to_int("#{global_stats.recovered}")
        tot_active = add_commas_to_int("#{global_stats.active}")
        puts ""
        puts ""
        puts "————————————————————————————————"
        puts "Welcome to COVID-19 Stats Check!"
        puts "————————————————————————————————"
        puts ""
        puts "Global Stats:"
        puts ""
        puts "TOTAL CASES | #{tot_cases}".colorize(:light_magenta)
        puts ""
        puts "TOTAL DEATHS | #{tot_deaths}".colorize(:light_red)
        puts ""
        puts "TOTAL RECOVERED | #{tot_recovered}".colorize(:green)
        puts ""
        puts "TOTAL ACTIVE | #{tot_active}".colorize(:light_yellow)
        puts ""
        puts "————————————————————————————————"
        continue_to_country_selection
    end
    
    def continue_to_country_selection
        puts ""
        puts "Would You Like To View Stats By Country? (y/n)"
        input = gets.strip
        if input == "yes" || input == "YES" || input == "y" || input == "Yes" || input == "Y"
            list_country_options
        elsif input == "no" || input == "NO" || input == "n" || input == "No" || input == "N"
            puts "Ok, Goodbye!"
        else
            continue_to_country_selection
        end

    end

    def list_country_options
        numbered_list = []
        i = 1
        Country.list_countries.each do |c|
            numbered_list << c.split("").insert(0, "#{i}. ").join
            i += 1
            # binding.pry
        end
        puts ""
        puts "———————————————————————————————————————"
        puts ""
        puts numbered_list
        puts ""
        puts "———————————————————————————————————————"
        puts ""
        user_country_selection
    end

    

    def user_country_selection
        puts "Enter The Number Corresponding To Your Selection (eg. 207)"
        input = gets.strip
        if input.to_i.to_s == input && input.to_i <= Country.list_countries.length
            selection = Country.find_from_input(input)
            tot_cases = add_commas_to_int("#{selection.cases}")
            tot_deaths = add_commas_to_int("#{selection.deaths}")
            tot_recovered = add_commas_to_int("#{selection.recovered}")
            tot_active = add_commas_to_int("#{selection.active}")
            critical = add_commas_to_int("#{selection.critical}")
            
            puts ""
            puts "———————————————————————————————————————"
            puts ""
            puts "#{selection.country} Coronavirus Stats:"
            puts ""
            puts "TOTAL CASES | #{tot_cases}".colorize(:light_magenta)
            puts ""
            puts "TOTAL DEATHS | #{tot_deaths}".colorize(:light_red)
            puts ""
            puts "TOTAL RECOVERED | #{tot_recovered}".colorize(:green)
            puts ""
            puts "TOTAL ACTIVE | #{tot_active}".colorize(:light_yellow)
            puts ""
            puts "CRITICAL | #{critical}".colorize(:cyan)
            puts ""
            puts "———————————————————————————————————————"
            puts ""

        else
            user_country_selection
        end   
        search_again     
    end

    def search_again
        puts "Would You Like To Search Again? (y/n)"
        input = gets.strip
        if input == "yes" || input == "YES" || input == "y" || input == "Yes" || input == "Y"
            list_country_options
        elsif input == "no" || input == "NO" || input == "n" || input == "No" || input == "N"
            puts ""
            puts "Ok, Goodbye!"
            puts ""
        else
            search_again
        end

    end
    
    # binding.pry



end

