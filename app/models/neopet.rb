class Neopet < ApplicationRecord
  require 'rufus-scheduler'
  belongs_to :user
  before_save(:define_stats, :get_img, :feed)
  validates :pet_name, presence: true
  validates :pet_name, length: { in: 5..20 }
  
  
  
  def define_stats
    self.att_stat = (rand(1..5) + rand(0..10))
    self.def_stat = (rand(1..5) + rand(0..10))
    self.spd_stat = (rand(1..5) + rand(0..10))
    self.hp_stat = (rand(1..5) + rand(0..10))
  end

  def get_img
    self.pet_pic = "/app/assets/images/neopets/#{rand(1..11)}.gif"
  end

  def feed 
    scheduler = Rufus::Scheduler.new
    if self.pet_hungry == false
      p "You put out the food, but it's not hungry yet"
      self.waiting_to_feed? = true
    else
      self.eat
      end
    end
  end

  def waiting_to_feed?
    if self.pet_hungry == false
      return true 
    else
      self.eat
    end
  end
end

def eat
  p "nom nom nom"
      self.pet_hungry = false
      self.current_hp_stat = self.hp_stat
      self.pet_pic = "/app/assets/images/neopets/#{self.pet_pic.delete("^0-9")}.gif"
      scheduler.in '10s', overlap: false do
        p "feed me daddy"                                     
        self.pet_pic = "/app/assets/images/neopets_sad/#{self.pet_pic.delete("^0-9")}.gif"
        if self.waiting_to_feed?
          self.eat
        end
end