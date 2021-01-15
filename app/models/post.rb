class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  # accept_nested_attributes_for :categories


  # to avoid creating the same category everytime we submit post form
  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      #self.post_categories.build(category: category)
      self.categories << category #this the same thing as the above line, but this is simpler and more readable
    end
  end

end
