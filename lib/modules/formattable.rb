module CovidStatsCli::Formattable
    module AddCommas
        def add_commas_to_int(num)
            split_num = num.to_s.split("")
            if split_num.length <= 3
                    split_num.join
            elsif split_num.length == 4
                    split_num.insert(1, ",").join
            elsif split_num.length == 5
                    split_num.insert(2, ",").join
            elsif split_num.length == 6 
                    split_num.insert(3, ",").join
            elsif split_num.length == 7
                    split_num.insert(1, ",").insert(5, ",").join
            elsif split_num.length == 8
                    split_num.insert(2, ",").insert(6, ",").join
            elsif split_num.length == 9
                    split_num.insert(3, ",").insert(7, ",").join
            elsif split_num.length == 10
                    split_num.insert(1, ",").insert(4, ",").insert(8, ",").join
            end
        end
    end
end
