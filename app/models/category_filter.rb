class CategoryFilter < ActiveRecord::Base
  belongs_to :category
  
  def self.findByCat(search)
  where("category_id = ?", "#{search}") 
  end

  
end
