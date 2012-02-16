class Season < ActiveRecord::Base

  def self.default
    where('start_date < ?', Date.today).order('start_date DESC').first
  end
  
  def title
    name
  end
  
end
