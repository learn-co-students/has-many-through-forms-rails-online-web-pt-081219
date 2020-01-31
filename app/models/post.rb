class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
# accepts_nested_attributes_for :categories
# if above was added it would creat duplicate categories it's really saying categories_attributes=

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.post_categories.build(category: category)
    end
  end
#above prevents duplicate categories from being created
end

