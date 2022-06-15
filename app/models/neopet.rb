class Neopet < ApplicationRecord
  include Feed
  belongs_to :user
  before_create do
    self.define_stats
    self.get_img
  end
  validates :pet_name, presence: true
  validates :pet_name, length: { in: 5..20 }


  
  def define_stats
    self.att_stat = (rand(1..5) + rand(0..10))
    self.def_stat = (rand(1..5) + rand(0..10))
    self.spd_stat = (rand(1..5) + rand(0..10))
    self.hp_stat = (rand(1..5) + rand(0..10))
  end

  def get_img
    self.pet_pic = "neopets/#{rand(1..11)}.png"
  end
end

