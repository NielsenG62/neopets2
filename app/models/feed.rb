# module Feed 
#   require 'rufus-scheduler'

#   def feed
#     if self.pet_hungry == false
#       p "You put out the food, but it's not hungry yet"
#       self.waiting_to_feed = true
#     else
#       self.eat
#     end
#   end

#   def eat
#     scheduler = Rufus::Scheduler.new
#     self.pet_hungry = false
#     self.current_hp_stat = self.hp_stat
#     self.pet_pic = "neopets/#{self.pet_pic.delete("^0-9")}.png"
#     scheduler.in '10s', overlap: false do                                   
#       self.pet_pic = "neopets_sad/#{self.pet_pic.delete("^0-9")}.png"
#       if self.waiting_to_feed == true
#         self.waiting_to_feed = false
#         self.eat
#       else
#         self.pet_hungry = true
#       end
#     end
#   end
# end

module Feed 
  require 'rufus-scheduler'

  def feed
    if self.pet_hungry == false
      p "You put out the food, but it's not hungry yet"
      self.update_attributes(waiting_to_feed: true)
    else
      self.eat
    end
  end

  def eat
    scheduler = Rufus::Scheduler.new
    self.update_attributes(pet_hungry: false)
    self.update_attributes(current_hp_stat: self.hp_stat)
    self.update_attributes(pet_pic: "neopets/#{self.pet_pic.delete("^0-9")}.png")
    scheduler.in '10s', overlap: false do                                   
      self.update_attributes(pet_pic: "neopets_sad/#{self.pet_pic.delete("^0-9")}.png")
      if self.waiting_to_feed == true
        self.update_attributes(waiting_to_feed: false)
        self.eat
      else
        self.update_attributes(pet_hungry: true)
      end
    end
  end
end