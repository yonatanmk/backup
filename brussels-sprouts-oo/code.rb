class Ingredient

  def initialize(quantity, name, unit = nil)
    @quantity = quantity
    @unit = unit
    @name = name
  end

  def summary
    return "#{@quantity}#{' ' if @unit}#{@unit} #{@name}"
  end

end

class Recipe

  def initialize(name, instructions, ingredient_list)
    @name = name
    @instructions = instructions
    @ingredient_list = ingredient_list
  end

  def summary
    puts "Name: #{@name}"
    puts
    puts 'Ingredients'
    @ingredient_list.each {|ingredient| puts ingredient.summary}
    puts
    puts 'Instructions'
    @instructions.each_with_index {|line, i| puts "#{i + 1}. #{line}"}
  end
end

name = 'Roasted Brussel Sprouts'
instructions = [
    'Preheat oven to 400 degrees F.',
    'Cut off the brown ends of the Brussels sprouts.',
    'Pull off any yellow outer leaves.',
    'Mix them in a bowl with the olive oil, salt and pepper.',
    'Pour them on a sheet pan and roast for 35 to 40 minutes.',
    'They should be until crisp on the outside and tender on the inside.',
    'Shake the pan from time to time to brown the sprouts evenly.',
    'Sprinkle with more kosher salt ( I like these salty like French fries).',
    'Serve and enjoy!'
    ]
ingredients = [
    Ingredient.new(1.5, 'Brussels sprouts', 'lb(s)'),
    Ingredient.new(3.0, 'Good olive oil', 'tbspn(s)'),
    Ingredient.new(0.75, 'Kosher salt', 'tspn(s)'),
    Ingredient.new(0.5, 'Freshly ground black pepper', 'tspn(s)')
]

roasted_sprouts = Recipe.new(name, instructions, ingredients)

name = 'Grilled Spiced Chicken Wings'
instructions = [
    'Heat grill to medium.',
    'In a large bowl, toss the wings with the olive oil and 1 tbsp of seasoning',
    'Grill uncovered, turning once, for 15 to 20 minutes.',
    'Meanwhile, in a large bowl, combine the butter and remaining seasoning.',
    'Add the wings and toss to combine.',
    'Serve with ranch dressing for dipping.'
    ]
ingredients = [
    Ingredient.new(8.0, 'Chicken wings'),
    Ingredient.new(1.0, 'Olive oil', 'tspn'),
    Ingredient.new(2.0, 'Seafood seasoning', 'tspn(s)'),
    Ingredient.new(3.0, 'Unsalted butter', 'tbsp(s)')
]

wings = Recipe.new(name, instructions, ingredients)

roasted_sprouts.summary

puts
puts '--------------------------------------------------------------------------'
puts
wings.summary
