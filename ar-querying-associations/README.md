How would you return all the recipes in your database?
Recipe.all

How would you return all the comments in your database?
Comment.all

How would you return the most recent recipe posted in your database?
Recipe.last

How would you return all the comments of the most recent recipe in your database?
Comment.where(id = Recipe.last.id)
Recipe.last.comments

How would you return the most recent comment of all your comments?
Comment.last

How would you return the recipe associated with the most recent comment in your database?
Recipe.where(id: Comment.last.recipe_id)
Comment.last.recipes

How would you return all comments that include the string brussels in them?
Comment.where('body like ?', '%brussels%')

Validations:

class Recipe < ActiveRecord::Base
  has_many :comments
  validates :name, presence: true, uniqueness: true, format: { with: /Brussel sprouts/}
  validates :servings, allow_nil: true, numericality: { greater_than_or_equal_to: 1 }
end

class Comment < ActiveRecord::Base
  belongs_to :recipe
  validates :body, presence: true, length: { maximum: 140}
  validates :recipe_id, presence: true
end
