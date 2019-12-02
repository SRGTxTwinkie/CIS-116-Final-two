class Game
  def initialize(args = {})
    @number = args[:number] || rand(1..10)
    @guesses = 0
    @wins = 0
    @rounds = 1
  end

  def guess(guess)
    @guesses += 1
    if @guesses >= 3
      lose()
      return
    end
    distance = (guess - @number).abs
    case distance
    when 0
      win()
      return
    when 1
      puts "Hot"
    when 2
      puts "Warm"
    when 3
      puts "Cold"
    else
      puts "Cold"
    end
    play()
  end

  def win()
    @wins += 1
    puts "You Won this round, you now have " + @wins.to_s + " wins"
    nextRound()
  end

  def lose()
    puts "You Lost this round"
    nextRound()
  end

  def nextRound()
    @number = rand(1..10)
    @guesses = 0
    @rounds += 1
    if @rounds > 10
      endGame()
      return
    end
    puts "now on round " + @rounds.to_s
    play()
  end

  def endGame()
    puts "Game Over!"
    if @wins <= 7
      puts "Amateur level"
    elsif @wins == 8
      puts "Advanced level"
    elsif @wins == 9
      puts "Proffesional level"
    elsif @wins == 10
      puts "Hacker Level"
    end
  end

  def play()
    guess = rand(1..10)
    puts
    print "Make a guess: #{guess} \n"
    if guess == "number"
      puts @number
    end
    guess(guess.to_i)
  end
end

myGame = Game.new
myGame.play()
