module Feed 
  require 'rufus-scheduler'

  def feed
    if self.pet_hungry == false
      self.update_attributes(waiting_to_feed: true)
    else
      self.eat
    end
  end

  def eat
    scheduler = Rufus::Scheduler.new
    self.update_attributes(pet_hungry: false,
                           current_hp_stat: self.hp_stat,
                           pet_pic: "neopets/#{self.pet_pic.delete("^0-9")}.png")
    scheduler.in '10s', overlap: false do                                   
      if self.waiting_to_feed == true
        self.update_attributes(waiting_to_feed: false)
        self.eat
      else
        self.update_attributes(pet_hungry: true,
                               pet_pic: "neopets_sad/#{self.pet_pic.delete("^0-9")}.png")
      end
    end
  end
end