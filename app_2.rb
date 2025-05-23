require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Message de bienvenue

puts "-------------------------------------------------
\n|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
\n|Le but du jeu est d'être le dernier survivant !|
\n-------------------------------------------------"

# Initialisation du joueur humain

puts "Créer le pseudo de ton joueur :"
pseudo = gets.chomp
player = HumanPlayer.new(pseudo)

puts "\nUn nouveau joueur entre dans l'arène || #{player.name} || sera t'il le vainqueur ou se fera t'il écraser !"

# Initialisation des bots

bots = []

bot1 = Player.new("Josiane")
bot2 = Player.new("José")

enemies = bots.map { |name| Player.new(name) }

puts "\nLes bots #{bot1.name} et #{bot2.name} entrent dans l'arène"

# Combat

while player.life_points > 0 && (bot1.life_points > 0 || bot2.life_points > 0)

    player.show_state

    puts "\nQuelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "\nAttaquer un joueur en vue :"
    print "0 - "
    bot1.show_state
    print "1 - "
    bot2.show_state
    puts "\nQuitter en écrivant 'leave'"
    print "\n> "

    action = gets.chomp

    if action == "a"
        player.search_weapon
    elsif action == "s"
        player.search_health_pack
    elsif action == "0"
        player.attacks(bot1)
    elsif action == "1"
        player.attacks(bot2)
    elsif action == "leave"
        puts "\nTu quittes le combat."
        break
    else
        puts "Commande inconnue, réessaie."
    end


    puts "\nLes bots t'attaquent !"

    enemies.each do |enemy|
        if enemy.life_points > 0
            enemy.attacks(player)
        end
    end

end

if action == "leave"
    puts "\nA bientôt pour une nouvelle partie !"
elsif player.life_points > 0
    puts "\nBRAVO ! TU AS GAGNE !"
else
    puts "\nLoser ! Tu as perdu !"
end