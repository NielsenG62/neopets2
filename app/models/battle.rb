module Battle
  def fight
    if rand(1..100) > 50
  
      return "win"
    else 
      return "lose"
    end
  end
end