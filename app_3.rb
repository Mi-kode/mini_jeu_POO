require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Message de bienvenue

puts "\n-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

# Initialisation du player

puts "\nCréer le pseudo de ton joueur :"
pseudo = gets.chomp
my_game = Game.new(pseudo)

puts "\nUn nouveau joueur entre dans l'arène ** #{my_game.human_player.name} ** sera-t-il le vainqueur ou se fera-t-il écraser !"

# Boucle principale du jeu

leave = false

while my_game.is_still_ongoing?
  my_game.show_players
  my_game.menu
  action = gets.chomp
  leave = true if my_game.menu_choice(action) == :leave
  break if leave
  my_game.enemies_attack
end

# Fin de partie

my_game.end_game(leave)

