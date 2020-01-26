class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories

  # accepts_nested_attributes_for :categories
  # Using a custom nested attribute setter to ensure we do NOT duplicate categories when we create them


  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.post_categories.build(category: category)
    end
  end

end
