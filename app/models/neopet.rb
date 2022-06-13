class Neopet < ApplicationRecord
  require 'rufus-scheduler'
  belongs_to :user
  before_save(:define_stats, :get_img)
  validates :name, presence: true
  validates :name, length: { in: 5..20 }
  
  private
    def define_stats
      self.att_stat = (rand(1..5) + rand(0..10))
      self.def_stat = (rand(1..5) + rand(0..10))
      self.spd_stat = (rand(1..5) + rand(0..10))
      self.hp_stat = (rand(1..5) + rand(0..10))
    end

    def get_img
      
    end

    def feed 
      scheduler = Rufus::Scheduler.new
      self.pet_hungry = false
      self.current_hp_stat = self.hp_stat
      scheduler.in '1m' do
        self.pet_hungry = true
      end
    end
end