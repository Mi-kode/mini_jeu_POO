require "pry"

class Player

    attr_accessor :name, :life_points, :attack_amount

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        puts "#{name} a #{life_points} points de vie    |"
    end

    def gets_damage(attack_amount)
        @attack_amount = attack_amount

        @life_points -= attack_amount

        if life_points <= 0
            puts "Le joueur #{name} a été tué !"
        else
        end
    end

    def compute_damage
        return rand(1..6)
    end

    def attacks(attacked_player)
        puts "\n#{name} attaque #{attacked_player.name}"
        damage = compute_damage
        attacked_player.gets_damage(damage)
        puts "Il lui inflige #{damage} points de dommages"
    end

end

class HumanPlayer < Player

    attr_accessor :weapon_level

    def initialize(name)
        super(name)
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        puts "\n#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon = rand(1..6)
        puts "\nTu as trouvé une arme de niveau #{new_weapon}"

        if new_weapon > weapon_level
            @weapon_level = new_weapon
            puts "\nYouhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else
            puts "\nM@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        health_pack = rand(1..6)

        if health_pack == 1
            puts "\nTu n'as rien trouvé"
        elsif health_pack.between?(2, 5)
            @life_points += 50
            
            if life_points > 100
                excess = @life_points - 100
                @life_points -= excess
            else
            end

            puts "\nBravo, tu as trouvé un pack de +50 points de vie !"
        else
            @life_points += 80
            
            if life_points > 100
                excess = @life_points - 100
                @life_points -= excess
            else
            end

            puts "\nWaow, tu as trouvé un pack de +80 points de vie !"
        end
    end

    def attacks(player)
        puts "\n#{@name} attaque #{player.name}"
        damage = compute_damage
        puts "Il lui inflige #{damage} points de dommages"
        player.gets_damage(damage)
    end

end

binding.pry
puts "end of file"