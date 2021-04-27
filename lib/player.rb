class Player
  attr_accessor :name, :life_points
  
  def initialize(name)
    @life_points = 10
    @name = name
  end

  def show_state
    "#{name} a #{life_points} points de vie. "
  end

  def gets_damage(dgt)
    @life_points = @life_points - dgt
    if @life_points <= 0
      puts "Le joueur #{name} a été tué !"
      puts "* DEAD * GAME OVER ..."
    else
      puts "#{name}, votre niveau de vie est de : #{@life_points}."
    end
  end

  def attacks(target)
    puts "Le joueur #{name} s'apprête à attaquer le joueur #{target.name}."
    att = compute_damage
    if target.life_points > 0
      puts "Il lui inflige #{att} points de dommages."
      puts " "
    end
    target.gets_damage(att)
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @life_points = 100
    @weapon_level = 1
    @name = name
  end

  def show_state
    puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}."
  end

  def search_weapon
    rand_lvl = rand(1..6)
    puts "Vous avez trouvé une arme de niveau #{rand_lvl}."
    if rand_lvl > @weapon_level
      @weapon_level = rand_lvl
      puts "> Youhou ! elle est meilleure que ton arme actuelle : tu la prends. (lvl: #{weapon_level}) !"
      puts " "
    else
      puts "> 🤬 M@*#$... elle n'est pas mieux que ton arme actuelle.. C'est CIAO !"
      puts " "
    end
  end

  def search_health_pack
    rand_health = rand(1..6)
    if rand_health == 1
      puts "Pas d'bol.. Tu n'as rien trouvé ... (#{rand_health})."
    elsif rand_health >= 2 && rand_health <= 5 
      if (( self.life_points + 50) > 100)
        self.life_points = 100
      else
        self.life_points += 50
      end
      puts "Bravo, tu as trouvé un pack de +50 points de vie ! (#{rand_health})."
    else rand_health == 6
      if (( self.life_points + 80) > 100)
        self.life_points = 100
      else
        self.life_points += 80
      end
      puts "Bravo, tu as trouvé un pack de +80 points de vie !! (#{rand_health})."
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

end
