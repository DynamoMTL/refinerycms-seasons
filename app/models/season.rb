class Season < ActiveRecord::Base

  has_many :pages
  has_many :images

  after_create :copy_page_structure_from_default_season

  cattr_accessor :current

  def self.default
    where('start_date < ?', Date.today).order('start_date DESC').first
  end
  
  def title
    name
  end

  private

  def copy_page_structure_from_default_season
    return if self == Season.default
    clone_pages(Season.first.pages.where(:parent_id => nil), nil, 0)
  end
  
  handle_asynchronously :copy_page_structure_from_default_season
  
  def clone_pages(pages, parent=nil, depth)
    depth += 1
    return if depth == 3
    pages.each do |page|
      cloned_page = page.clone
      cloned_page.parent = parent
      Page.default_parts.each_with_index do |page_part, index|
        cloned_page.parts << PagePart.new(:title => page_part, :position => index)
      end
      self.pages << cloned_page
      clone_pages(page.children, cloned_page, depth)
    end
  end

end
