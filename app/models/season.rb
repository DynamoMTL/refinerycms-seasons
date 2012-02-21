class Season < ActiveRecord::Base

  has_many :pages
  has_many :images

  def self.default
    where('start_date < ?', Date.today).order('start_date DESC').first
  end
  
  def title
    name
  end
  
end
