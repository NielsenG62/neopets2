module Battle
  def fight
    if rand(1..100) > 50
      return "you win"
    else 
      return "you lose"
    end
  end
end