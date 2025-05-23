require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Initialisation des combattants

player1 = Player.new("Josiane")
player2 = Player.new("José")

# Appel des combattants

puts "\n#{player1.name} VS #{player2.name}"

puts "\nVoici l'état de chaque joueur :"
puts ""
puts "\n#{player1.show_state}"
puts "#{player2.show_state}"

puts "FIGHT !"

# Combats

while player1.life_points > 0 && player2.life_points > 0

    if player1.life_points > 0

        player2.attacks(player1)
        player1.show_state
    end

    if player2.life_points > 0

        player1.attacks(player2)
        player2.show_state
    end

end

binding.pry