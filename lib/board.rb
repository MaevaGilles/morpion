#initialize board object

class Board
    attr_accessor :array
  
    def initialize
      @array = []
      
      for i in 0..8
        @array[i] = BoardCase.new
      end
    end
  
    #methods to play the game with all prompt infos.
    def play_turn(player)
      puts "Voici l'état de la grille:"
      self.show
      puts "#{player.name}, c'est à ton tour!"
      puts "Dans quelle case veux-tu te placer?"
      choice = (gets.chomp.to_i) - 1
      if (choice > 9) || (choice.negative?)
        puts "Option invalide!"
      elsif array[choice].value != ' '
        puts "Attention! La case est déjà prise! Bravo, tu passes ton tour! {1F630}"
      else
        array[choice].value = player.value
        puts "\nQuelle stratégie!!!"
      end
      puts ""
    end
  
    def game_nul?
      nul = 0
      array.each do |i|
        if i.value == ' '
          nul += 1
        end
      end
      if nul == 0
        return true
      else
        return false
      end
    end
  
    #Boolean checking all cases of victory -> it returns true if he finds a winner, else return false.
    def victory?
      # row check
      if (array[0].value == array[1].value) && (array[1].value == array[2].value) && (array[0].value != ' ')
        self.show
        return true
      elsif (array[3].value == array[4].value) && (array[4].value == array[5].value) && (array[3].value != ' ')
        self.show
        return true
      elsif (array[6].value == array[7].value) && (array[7].value == array[8].value) && (array[6].value != ' ')
        self.show
        return true
      # column check
      elsif (array[0].value == array[3].value) && (array[3].value == array[6].value) && (array[0].value != ' ')
        self.show
        return true
      elsif (array[1].value == array[4].value) && (array[4].value == array[7].value) && (array[1].value != ' ')
        self.show
        return true
      elsif (array[2].value == array[5].value) && (array[5].value == array[8].value) && (array[2].value != ' ')
        self.show
        return true
      # diagonal check
      elsif (array[0].value == array[4].value) && (array[4].value == array[8].value) && (array[0].value != ' ')
        self.show
        return true
      elsif (array[2].value == array[4].value) && (array[4].value == array[6].value) && (array[2].value != ' ')
        self.show
        return true
      else
        return false
      end
    end
  
    #method to display to grid on the CLI
    def show
      puts "\n\n"
      puts ' ' * 10 + '-' * 19
      puts ' ' * 10 + ('|' + ' ' * 5) * 3 + '|'
      puts ' ' * 10 + "|  #{array[0].value}  |  #{array[1].value}  |  #{array[2].value}  |"
      puts ' ' * 10 + ('|' + ' ' * 4 + '1') + ('|' + ' ' * 4 + '2') + ('|' + ' ' * 4 + '3') + '|'
      puts ' ' * 10 + '-' * 19
      puts ' ' * 10 + ('|' + ' ' * 5) * 3 + '|'
      puts ' ' * 10 + "|  #{array[3].value}  |  #{array[4].value}  |  #{array[5].value}  |"
      puts ' ' * 10 + ('|' + ' ' * 4 + '4') + ('|' + ' ' * 4 + '5') + ('|' + ' ' * 4 + '6') + '|'
      puts ' ' * 10 + '-' * 19
      puts ' ' * 10 + ('|' + ' ' * 5) * 3 + '|'
      puts ' ' * 10 + "|  #{array[6].value}  |  #{array[7].value}  |  #{array[8].value}  |"
      puts ' ' * 10 + ('|' + ' ' * 4 + '7') + ('|' + ' ' * 4 + '8') + ('|' + ' ' * 4 + '9') + '|'
      puts ' ' * 10 + '-' * 19
    end
  end