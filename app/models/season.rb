class Season < ActiveRecord::Base

  has_many :pages
  has_many :images

  after_create :copy_page_structure_from_default_season

  def self.default
    where('start_date < ?', Date.today).order('start_date DESC').first
  end
  
  def title
    name
  end

  private

  def copy_page_structure_from_default_season
    return if self == Season.default
    Season.default.pages.each do |page|
      next if page.level > 1
      pages << page.clone
    end
  end

end
