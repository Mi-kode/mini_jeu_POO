class Game

    attr_accessor :human_player, :enemies, :players_left, :ennemies_in_sight

    def initialize(name)
        enemies_in_sight = []
        players_left = 10

        @human_player = HumanPlayer.new(name)

        bots = ["Octane", "Wraith", "Gibraltar", "Horizon"]
        @enemies = bots.map { |name| Player.new(name) }

        bot_list = @enemies.map(&:name).join(", ")
        puts "\nLes bots #{bot_list} entrent dans l'arène"
    end

    def kill_player(dead_player)
        @enemies.delete(dead_player)
    end

    def is_still_ongoing?
        return @human_player.life_points > 0 && !@enemies.empty?
    end

    def show_players
        @human_player.show_state
        number_of_player = @enemies.count
        puts "\nIl reste #{number_of_player} bot(s) encore en vie"
    end

    def menu
        print "\n-------------------------------------"
        puts "\n| Quelle action veux-tu effectuer ? |"
        puts "| a - chercher une meilleure arme   |"
        puts "| s - chercher à se soigner         |"
        puts "\n| Attaquer un joueur en vue :       |"
        @enemies.each_with_index do |enemy, index|
            print "| #{index} - "
            enemy.show_state
        end
        print "\n| Quitter en écrivant 'leave'       |"
        puts "\n-------------------------------------"
        print "> "
    end

    def menu_choice (action)
        return :leave if action == "leave"

        if action == "a"
            @human_player.search_weapon
        elsif action == "s"
            @human_player.search_health_pack
        elsif action.to_i.between?(0, @enemies.length - 1)
            @human_player.attacks(@enemies[action.to_i])
        else
            puts "Commande inconnue, réessaie."
        end

        @enemies.each do |enemy|
            kill_player(enemy) if enemy.life_points <= 0
        end
    end

    def enemies_attack
        @enemies.each do |enemy|
            if enemy.life_points > 0 && @human_player.life_points > 0
                enemy.attacks(@human_player)
            end
        end
    end

    def end_game(leave = false)
        if leave
            puts "\nDommage, à bientôt pour une nouvelle partie !"
        elsif @human_player.life_points > 0
            puts "\nBRAVO ! TU AS GAGNE !"
        else
            puts "\nLoser ! Tu as perdu !"
        end
    end

    def new_players_in_sight

    end

end