require_relative '../config/environment.rb'
require_relative './formattable.rb'

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
        sleep(0.065)
        puts ""
        puts "Global Stats:"
        sleep(0.065)
        puts ""
        puts "  • TOTAL CASES | #{tot_cases}".colorize(:light_magenta)
        sleep(0.065)
        puts ""
        puts "  • TOTAL DEATHS | #{tot_deaths}".colorize(:light_red)
        sleep(0.065)
        puts ""
        puts "  • TOTAL RECOVERED | #{tot_recovered}".colorize(:green)
        sleep(0.065)
        puts ""
        puts "  • TOTAL ACTIVE | #{tot_active}".colorize(:light_yellow)
        sleep(0.065)
        puts ""
        puts "————————————————————————————————"
        sleep(0.065)
        continue_to_country_selection
    end

    
    def continue_to_country_selection
        puts ""
        puts "Would You Like To View Stats By Country? (y/n)"
        input = gets.strip
        if input == "yes" || input == "YES" || input == "y" || input == "Yes" || input == "Y"
            list_country_options
        elsif input == "no" || input == "NO" || input == "n" || input == "No" || input == "N"
            sleep(0.065)
            puts ""
            puts "Ok, Goodbye!".colorize(:light_cyan)
            puts ""
        else
            puts ""
            puts "———————————————————————————————————————"
            puts "INVALID INPUT: #{input}".colorize(:light_red)
            puts "———————————————————————————————————————"
            puts ""
            continue_to_country_selection
        end
    end


    def list_country_options
        numbered_list = []
        i = 1
        Country.list_countries.each do |c|
            numbered_list << c.split("").insert(0, "#{i.to_s.insert(-1, ".").colorize(:light_cyan)} ").join
            i += 1
            # binding.pry
        end
        puts ""
        puts "———————————————————————————————————————"
        puts ""
        #sleeps each item in list to display smoothly
        numbered_list.each do |item|
            sleep(0.006)
            puts item
        end
        puts ""
        puts "———————————————————————————————————————"
        puts ""
        user_country_selection
    end


    def user_country_selection
        puts "Enter The Number Corresponding To Your Selection (e.g. #{"207".colorize(:light_cyan)})"
        input = gets.strip
        if input.to_i.to_s == input && input.to_i <= Country.list_countries.length
            selection = Country.find_from_input(input)
            tot_cases = add_commas_to_int("#{selection.cases}")
            tot_deaths = add_commas_to_int("#{selection.deaths}")
            tot_recovered = add_commas_to_int("#{selection.recovered}")
            tot_active = add_commas_to_int("#{selection.active}")
            tot_tests = add_commas_to_int("#{selection.totalTests}")
            critical = add_commas_to_int("#{selection.critical}")
            today_cases = add_commas_to_int("#{selection.todayCases}")
            today_deaths = add_commas_to_int("#{selection.todayDeaths}")
            puts ""
            puts ""
            puts "———————————————————————————————————————"
            puts "#{selection.country.colorize(:light_cyan)} Coronavirus Stats:"
            puts "———————————————————————————————————————"
            sleep(0.065)
            puts ""
            puts "Total:"
            sleep(0.065)
            puts ""
            puts "  • CASES | #{tot_cases}".colorize(:light_magenta)
            sleep(0.065)
            puts ""
            puts "  • DEATHS | #{tot_deaths}".colorize(:light_red)
            sleep(0.065)
            puts ""
            puts "  • RECOVERED | #{tot_recovered}".colorize(:green)
            sleep(0.065)
            puts ""
            puts "  • ACTIVE | #{tot_active}".colorize(:light_yellow)
            sleep(0.065)
            puts ""
            puts "  • TESTED | #{tot_tests}".colorize(:light_blue)
            sleep(0.065)
            puts ""
            puts "  • CRITICAL | #{critical}".colorize(:cyan)
            sleep(0.065)
            puts ""
            puts ""
            puts "Today:"
            sleep(0.065)
            puts ""
            puts "  • CASES | #{today_cases}".colorize(:light_magenta)
            sleep(0.065)
            puts ""
            puts "  • DEATHS | #{today_deaths}".colorize(:light_red)
            sleep(0.065)
            puts ""
            puts "———————————————————————————————————————"
            sleep(0.065)
            puts ""
        else
            puts ""
            puts "———————————————————————————————————————"
            puts "INVALID INPUT: #{input}".colorize(:light_red)
            puts "———————————————————————————————————————"
            puts ""
        end   
        search_again     
    end

    def search_again
        puts "Would You Like To Search Again? (y/n)"
        input = gets.strip
        if input == "yes" || input == "YES" || input == "y" || input == "Yes" || input == "Y"
            list_country_options
        elsif input == "no" || input == "NO" || input == "n" || input == "No" || input == "N"
            sleep(0.065)
            puts ""
            puts "Ok, Goodbye!".colorize(:light_cyan)
            puts ""
        else
            puts ""
            puts "———————————————————————————————————————"
            puts "INVALID INPUT: #{input}".colorize(:light_red)
            puts "———————————————————————————————————————"
            puts ""
            search_again
        end
    end
    
    # binding.pry
end

