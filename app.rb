# Appel les gems de Gemfile :
require 'bundler'
Bundler.require

# Liens appellant les fichiers "game.rb" et "player.rb" situés dans le dossier "lib" :
require_relative 'lib/game'
require_relative 'lib/player'

# Création de nos deux personnages :
player1 = Player.new("Josiane")
player2 = Player.new("Juan")

# Entrée dans l'arène :
puts "*****     Ladieeees & Gentlemeeeeeens     *****"

puts " "
puts "À ma droite, tout droit venue de Bourg-en-Bresse ..: #{player1.name} !"
puts "À ma gauche, du haut de sa montagne de nachos ! Le sol ibérique frémit sous les talons ..: Paquito ..Pepito .. #{player2.name} !"
puts " "

puts "¡¡¡ HAAAAAAAAJIMEEEEEE !!!"
puts " "

# Création d'une boucle afin de créer les rounds de combat (tour par tour) :
while player1.life_points > 0 && player2.life_points > 0
  puts "Voici l'état de chaque combattant :" 
  puts player1.show_state
  puts player2.show_state
  puts " "

  puts "Passons à la phase d'attaque :"
  puts player1.attacks(player2)
  if player2.life_points <= 0
    break
  end
  puts "Le combat continue !"
  puts player2.attacks(player1)
end

#binding.pry