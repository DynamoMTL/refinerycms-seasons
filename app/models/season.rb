class Season < ActiveRecord::Base

  # def title was created automatically because you didn't specify a string field
  # when you ran the refinery_engine generator. Love, Refinery CMS.
  def title
    name
  end
  
end
