# Appel les gems de Gemfile :
require 'bundler'
Bundler.require

# Liens appellant les fichiers "game.rb" et "player.rb" situés dans le dossier "lib" :
require_relative 'lib/game'
require_relative 'lib/player'

# Entrée dans le District 13
puts " --------------------------------------------------------------"
puts "| Bieeeeeenvenue aux 24ème jeux des Hung'Adri Gaaaaaaames !!! |"
puts "|            Puisse le sort vous être favorable ...           |"
puts " --------------------------------------------------------------"

# Interaction avec l'utilisateur :
puts "Veuillez entre votre pseudo :"
print "> "
name_player = gets.chomp
username = HumanPlayer.new(name_player)

# Création d'un tableau pour les deux combattants :
enemies = []
enemies << player1 = Player.new("Moundir")
enemies << player2 = Player.new("Denis_Brognard")

# Création d'une boucle 'while' + statut utilisateur :
while username.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts "Voici l'état de votre joueur : "
  puts username.show_state
  puts "-------------------------------------------------------"

# Entrée dans le menu du combat :
  puts " "
  puts "Quelle action veux-tu effectuer ?"
  puts " "
  puts "a - Chercher une meilleure arme"
  puts "s - Chercher à se soigner"
  puts " "
  puts "Attaquer un joueur en vue :"
  if player1.life_points > 0
    puts "0 - #{player1.show_state}"
  end
  if player2.life_points > 0
    puts "1 - #{player2.show_state}"
  end
  print "> "
  action = gets.chomp
# Condition du menu, à chaque "entrée utilisateur" --> une action est exécutée :
  if action == "a"
    username.search_weapon
  elsif action == "s"
    username.search_health_pack
  elsif action == "0"
    username.attacks(player1)
  elsif action == "1"
    username.attacks(player2)
  else
    puts "ERREUR ! Veuillez entrer un caractère valide."
    print "> "
    action = gets.chomp
  end
# Condition permettant de savoir si les adversaires sont H.S ou non, si non à l'attaque :
  enemies.each do |player|
    if player.life_points > 0
      puts "Les autres joueurs contre-attaquent ! Préparez-vous."
      player.attacks(username)
    else
      puts "Ce joueur n'a plus de points de vie."
    end
  end

end

# Fin du jeu :
puts " "
puts "La partie est finie."

# Condition permettant de savoir si notre perso est H.S ou non, et juger s'il remporte la game :
if username.life_points > 0
  puts "BRAVO !! TU AS REMPORTÉ LES JEUX ! #Top1"
else
  puts "LOSER !! Game Over ! Tu as perdu ..."
end
