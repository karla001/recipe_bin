User.destroy_all
Recipe.destroy_all
# TimeFrame.destroy_all
Ingredient.destroy_all

users = User.create([
  {name: "Karla", email: "karla@email.com", tagline: "Mama Mia!", password: "abc123", password_confirmation: "abc123"}
])

recipe = users[0].recipes.create([
  {
    name: "Apple Asparagus Medley",
    instruction: "Put it all in a bowl already",
    feeds: 2,
    image: "friendship",
    price: 2.99,
  }
])

recipe[0].ingredients.create([
  { name: "Asparagus", portion: 3.3, p_unit_of_measure: "lb", brand: "dole" }
])

puts "DB seeded with #{User.all.length} users, #{Recipe.all.length} recipes, and #{Ingredient.all.length} ingredients."
