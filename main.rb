require 'json'

players = JSON.load_file('scoreboard.json')
# last_winner = ""

def leaderboard_display(arr, menu)
    sorted = arr.clone.sort_by { |player| player[4] }
    sorted.reverse!.each_with_index do |player, i|
        if menu == "summary"
        puts "#{i + 1}. #{player[0]} Score: #{player[4]}"
        elsif menu == "details"
            puts "#{i + 1}. #{player[0]} With #{player[1]} First place wins, #{player[2]} runner up placements and #{player[3]} 3rd placements."
        end
    end
end

def score_adder(first, second, third, arr)
    if arr.any? { |s| s.include?(first) }
    arr.each_with_index do |_player, i|
        arr[i][1] += 1 if arr[i].include?(first)
    end
    else
        arr.push([first, 1, 0, 0, 0])
    end
    if arr.any? { |s| s.include?(second) }
    arr.each_with_index do |_player, i|
        arr[i][2] += 1 if arr[i].include?(second)
    end
    else
        arr.push([second, 0, 1, 0, 0])
    end
    if arr.any? { |s| s.include?(third) }
    arr.each_with_index do |_player, i|
        arr[i][3] += 1 if arr[i].include?(third)
    end
    else
        arr.push([third, 0, 0, 1, 0])
    end

    arr.each_with_index do |_player, i|
            arr[i][4] = ((arr[i][1]) * 3) + (arr[i][2] *2) + arr[i][3]
    end
end

quit = false
while quit == false
    system "clear"
    puts "Welcome to the Kahoot Kompanion! Enter what you would like to do below"
    puts "1. View leaderboard"
    puts "2. Admin Control"
    puts "3. Exit"
    input = gets.chomp.to_i
    case input
    when 1
        leaderboard_menu = true
        while leaderboard_menu == true
            # puts "Please congragulate our most recent winner, #{last_winner}"
            puts "What would you like to do?"
            puts "1. Placement summary"
            puts "2. Placement details"
            puts "3. Back"
            choice = gets.chomp.to_i
            if choice == 1
                menu = "summary"
                system "clear"
                leaderboard_display(players, menu)
            elsif choice == 2
                menu = "details"
                system "clear"
                leaderboard_display(players, menu)
            elsif choice == 3
                leaderboard_menu = false
            else
                puts "Incorrect input"
            end
        end

    when 2
        admin_menu = true
        while admin_menu == true
        puts "Please enter the password to modify the leaderboard"
        puts "Or type back to navigate back."
        pw = gets.chomp
        if pw == "plaintextpasswordlol"
            puts "Please enter the name of todays champion"
            champ = gets.chomp.capitalize
            puts "Please enter todays runner up"
            runner_up = gets.chomp.capitalize
            puts "Enter today's third place player"
            third = gets.chomp.capitalize
            score_adder(champ, runner_up, third, players)
            last_winner = champ
            File.write('scoreboard.json', JSON.pretty_generate(players))
        elsif pw == "back"
            admin_menu = false
        else
            puts "Incorrect password please try again"
        end
        end
    when 3
        quit = true
    end
end
