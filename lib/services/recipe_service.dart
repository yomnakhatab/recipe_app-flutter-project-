import '../models/recipe.dart';

class RecipeService {
  static List<Map<String, dynamic>> fakeApiData = [
    {
      "id": 1,
      "name": "Classic Blueberry Pancakes",
      "imageUrl": "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=800&q=80",
      "category": "breakfast",
      "prepTime": 10,
      "cookTime": 15,
      "servings": 4,
      "difficulty": "easy",
      "rating": 4.8,
      "ingredients": [
        "2 cups all-purpose flour",
        "2 large eggs",
        "1 ¾ cups whole milk",
        "2 tablespoons granulated sugar",
        "2 teaspoons baking powder",
        "½ teaspoon salt",
        "3 tablespoons melted butter",
        "1 cup fresh blueberries",
        "1 teaspoon vanilla extract"
      ],
      "steps": [
        "In a large bowl, whisk together flour, sugar, baking powder, and salt until well combined.",
        "In a separate bowl, beat eggs and add milk, melted butter, and vanilla extract.",
        "Pour the wet ingredients into the dry ingredients and mix until just combined. Don't overmix - lumps are okay!",
        "Gently fold in the fresh blueberries, being careful not to crush them.",
        "Heat a non-stick griddle or pan over medium heat and lightly grease with butter.",
        "Pour ¼ cup of batter for each pancake onto the hot griddle.",
        "Cook until bubbles form on the surface and edges look set (about 2-3 minutes).",
        "Flip carefully and cook for another 2 minutes until golden brown.",
        "Serve hot with maple syrup, butter, and extra blueberries on top."
      ]
    },
    {
      "id": 2,
      "name": "Avocado Toast with Poached Egg",
      "imageUrl": "https://images.unsplash.com/photo-1588137378633-dea1336ce1e2?w=800&q=80",
      "category": "breakfast",
      "prepTime": 5,
      "cookTime": 10,
      "servings": 2,
      "difficulty": "easy",
      "rating": 4.7,
      "ingredients": [
        "2 slices sourdough bread",
        "1 ripe avocado",
        "2 large eggs",
        "1 tablespoon white vinegar",
        "2 tablespoons olive oil",
        "Salt and pepper to taste",
        "Red pepper flakes",
        "Fresh cherry tomatoes",
        "Microgreens for garnish"
      ],
      "steps": [
        "Toast the sourdough bread until golden and crispy.",
        "While bread is toasting, bring a pot of water to a gentle simmer and add vinegar.",
        "Crack eggs into small bowls individually.",
        "Create a gentle whirlpool in the water and carefully slide eggs in one at a time.",
        "Poach eggs for 3-4 minutes until whites are set but yolks are still runny.",
        "Mash the avocado with salt, pepper, and a drizzle of olive oil.",
        "Spread the mashed avocado generously on the toasted bread.",
        "Carefully place the poached egg on top of each avocado toast.",
        "Season with salt, pepper, red pepper flakes, and garnish with microgreens and halved cherry tomatoes."
      ]
    },
    {
      "id": 3,
      "name": "Authentic Italian Spaghetti Carbonara",
      "imageUrl": "https://plus.unsplash.com/premium_photo-1723575632700-f58f9322db42?q=80&w=1091&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "category": "lunch",
      "prepTime": 10,
      "cookTime": 20,
      "servings": 4,
      "difficulty": "medium",
      "rating": 4.9,

    
      "ingredients": [
        "400g spaghetti",
        "200g guanciale or pancetta, diced",
        "4 large egg yolks",
        "1 whole egg",
        "100g Pecorino Romano cheese, finely grated",
        "50g Parmigiano-Reggiano cheese, finely grated",
        "Freshly ground black pepper",
        "Salt for pasta water"
      ],
      "steps": [
        "Bring a large pot of salted water to boil for the pasta.",
        "In a bowl, whisk together egg yolks, whole egg, and both grated cheeses. Add generous black pepper.",
        "Cook the guanciale in a large pan over medium heat until crispy and golden (about 8-10 minutes).",
        "Cook spaghetti according to package directions until al dente. Reserve 1 cup of pasta water.","Remove guanciale pan from heat and let it cool slightly for 2 minutes.",
        "Drain pasta and add it immediately to the pan with guanciale, tossing to coat.",
        "Remove pan from heat completely. Add egg mixture and toss quickly, adding pasta water gradually.",
        "Keep tossing continuously until the sauce becomes creamy and coats the pasta beautifully.",
        "Serve immediately with extra grated cheese and black pepper on top."
      ]
    },
    {
      "id": 4,
      "name": "Grilled Salmon with Lemon Butter",
      "imageUrl": "https://media.istockphoto.com/id/483063958/photo/roasted-salmon-and-vegetables.webp?a=1&b=1&s=612x612&w=0&k=20&c=dj7WsqEANzL4-mwLMoPmTk-MM4bGNZw0FnHi1IUz0uU=",
      "category": "lunch",
      "prepTime": 15,
      "cookTime": 12,
      "servings": 4,
      "difficulty": "easy",
      "rating": 4.8,
      "ingredients": [
        "4 salmon fillets (6 oz each)",
        "4 tablespoons butter",
        "2 lemons (1 for juice, 1 sliced)",
        "3 cloves garlic, minced",
        "2 tablespoons fresh dill, chopped",
        "1 tablespoon olive oil",
        "Salt and pepper to taste",
        "Fresh parsley for garnish"
      ],
      "steps": [
        "Remove salmon from refrigerator 15 minutes before cooking to bring to room temperature.",
        "Preheat your grill to medium-high heat (about 400°F).",
        "Pat salmon fillets dry with paper towels and brush both sides with olive oil.",
        "Season generously with salt and pepper on both sides.",
        "Place salmon skin-side down on the grill and cook for 6-7 minutes without moving.",
        "Carefully flip and cook for another 4-5 minutes until salmon flakes easily with a fork.",
        "While salmon cooks, melt butter in a small saucepan with minced garlic.",
        "Add lemon juice and fresh dill to the butter mixture, stirring well.",
        "Place grilled salmon on serving plates, drizzle with lemon butter sauce, and garnish with fresh parsley and lemon slices."
      ]
    },
    {
      "id": 5,
      "name": "Thai Green Curry with Chicken",
      "imageUrl": "https://media.istockphoto.com/id/2223887328/photo/chicken-curry-asian-food-masala-traditional-cooking-healthy-food-with-spices-arranged-on-a.webp?a=1&b=1&s=612x612&w=0&k=20&c=GbvJOt7aoYMKBq7kHCEQcLgBznLmJ3OezYzAx-SCg98=",
      "category": "dinner",
      "prepTime": 20,
      "cookTime": 25,
      "servings": 4,
      "difficulty": "medium",
      "rating": 4.7,
      "ingredients": [
        "500g chicken breast, sliced",
        "2 tablespoons green curry paste",
        "400ml coconut milk",
        "1 cup chicken broth",
        "2 tablespoons fish sauce",
        "1 tablespoon brown sugar",
        "1 red bell pepper, sliced",
        "1 cup bamboo shoots",
        "Thai basil leaves",
        "2 kaffir lime leaves",
        "2 tablespoons vegetable oil"
      ],
      "steps": [
        "Heat oil in a large wok or deep pan over medium-high heat.",
        "Add green curry paste and stir-fry for 1-2 minutes until fragrant.",
        "Add sliced chicken and cook until it turns white on all sides.",
        "Pour in half of the coconut milk and stir to combine with the curry paste.",
        "Add chicken broth, fish sauce, and brown sugar. Bring to a gentle simmer.",
        "Add bell peppers, bamboo shoots, and kaffir lime leaves.",
        "Simmer for 10-12 minutes until chicken is fully cooked and vegetables are tender.",
        "Stir in the remaining coconut milk and heat through.",
        "Remove from heat and stir in fresh Thai basil leaves.",
        "Serve hot over steamed jasmine rice."
      ]
    },
    {
      "id": 6,
      "name": "Beef Wellington",
      "imageUrl": "https://images.unsplash.com/photo-1565299715199-866c917206bb?q=80&w=780&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "category": "dinner",
      "prepTime": 45,
      "cookTime": 40,
      "servings": 6,
      "difficulty": "hard",
      "rating": 4.9,
      "ingredients": [
        "1.5 kg beef tenderloin",
        "500g puff pastry",
        "300g mushrooms, finely chopped",
        "6 slices prosciutto",
        "2 tablespoons Dijon mustard",
        "2 egg yolks, beaten",
        "3 tablespoons butter",
        "2 shallots, minced",
        "Fresh thyme",
        "Salt and black pepper"
      ],
      "steps": ["Season beef tenderloin generously with salt and pepper.",
        "Sear beef in hot pan on all sides until golden brown (about 2 minutes per side). Let cool.",
        "Brush cooled beef with Dijon mustard on all sides.",
        "Sauté mushrooms with shallots and thyme until all moisture evaporates. Let cool completely.",
        "Lay out plastic wrap and arrange prosciutto slices in overlapping pattern.",
        "Spread mushroom mixture (duxelles) evenly over prosciutto.",
        "Place beef on top and roll tightly using plastic wrap. Refrigerate for 30 minutes.",
        "Roll out puff pastry into a large rectangle, place wrapped beef in center.",
        "Wrap pastry around beef, sealing edges with beaten egg. Brush entire surface with egg wash.",
        "Score pastry decoratively and refrigerate for 15 minutes.",
        "Bake at 200°C (400°F) for 25-30 minutes until pastry is golden brown.",
        "Let rest for 10 minutes before slicing into thick portions."
      ]
    },
    {
      "id": 7,
      "name": "Decadent Chocolate Lava Cake",
      "imageUrl": "https://images.unsplash.com/photo-1624353365286-3f8d62daad51?w=800&q=80",
      "category": "dessert",
      "prepTime": 15,
      "cookTime": 12,
      "servings": 4,
      "difficulty": "medium",
      "rating": 4.9,
      "ingredients": [
        "200g dark chocolate (70% cocoa)",
        "150g butter, plus extra for greasing",
        "4 large eggs",
        "4 egg yolks",
        "100g granulated sugar",
        "60g all-purpose flour",
        "1 teaspoon vanilla extract",
        "Pinch of salt",
        "Cocoa powder for dusting",
        "Vanilla ice cream for serving"
      ],
      "steps": [
        "Preheat oven to 220°C (425°F).",
        "Generously butter 4 ramekins and dust with cocoa powder, tapping out excess.",
        "Melt chocolate and butter together in a double boiler, stirring until smooth.",
        "In a separate bowl, whisk eggs, egg yolks, and sugar until thick and pale.",
        "Fold the melted chocolate mixture into the egg mixture gently.",
        "Sift flour and salt over the mixture and fold in carefully until just combined.",
        "Add vanilla extract and mix gently.",
        "Divide batter evenly among prepared ramekins, filling them about ¾ full.",
        "Bake for 12-14 minutes until edges are firm but center is still soft.",
        "Let cool for 1 minute, then carefully invert onto serving plates.",
        "Serve immediately with vanilla ice cream and dust with powdered sugar."
      ]
    },
    {
      "id": 8,
      "name": "Classic Tiramisu",
      "imageUrl": "https://media.istockphoto.com/id/2240798934/photo/classic-tiramisu-dessert-with-cocoa.webp?a=1&b=1&s=612x612&w=0&k=20&c=gwfLOcOJBW1-CWe7UH5CueE5JYNdkJ9Lpi1MrCeaFZM=",
      "category": "dessert",
      "prepTime": 30,
      "cookTime": 0,
      "servings": 8,
      "difficulty": "medium",
      "rating": 4.8,
      "ingredients": [
        "6 large egg yolks",
        "150g granulated sugar",
        "500g mascarpone cheese",
        "2 cups strong espresso, cooled",
        "3 tablespoons coffee liqueur (Kahlúa)",
        "300g ladyfinger cookies",
        "Unsweetened cocoa powder",
        "Dark chocolate shavings",
        "Pinch of salt"
      ],
      "steps": [
        "Beat egg yolks with sugar in a heatproof bowl until pale and thick.",
        "Place bowl over simmering water and whisk constantly until mixture reaches 160°F.",
        "Remove from heat and let cool to room temperature.",
        "Beat mascarpone cheese until smooth and creamy.",
        "Gently fold cooled egg mixture into mascarpone until well combined.",
        "Mix espresso with coffee liqueur in a shallow dish.",
        "Quickly dip ladyfingers in coffee mixture (1-2 seconds per side) and arrange in a layer in your dish.",
        "Spread half of the mascarpone mixture over the ladyfinger layer.",
        "Repeat with another layer of dipped ladyfingers and remaining mascarpone.",
        "Cover and refrigerate for at least 4 hours, preferably overnight.",
        "Before serving, dust generously with cocoa powder and garnish with chocolate shavings."]
    },
    {
      "id": 9,
      "name": "French Crème Brûlée",
      "imageUrl": "https://plus.unsplash.com/premium_photo-1675806017352-8505a8721c84?q=80&w=765&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "category": "dessert",
      "prepTime": 15,
      "cookTime": 45,
      "servings": 6,
      "difficulty": "medium",
      "rating": 4.8,
      "ingredients": [
        "2 cups heavy cream",
        "1 vanilla bean (or 2 tsp vanilla extract)",
        "5 large egg yolks",
        "½ cup granulated sugar, plus extra for topping",
        "Pinch of salt",
        "Boiling water for water bath"
      ],
      "steps": [
        "Preheat oven to 150°C (300°F).",
        "Split vanilla bean lengthwise and scrape out seeds.",
        "Heat cream with vanilla bean and seeds in a saucepan until it just begins to simmer.",
        "Whisk egg yolks with sugar and salt in a bowl until smooth and pale.",
        "Slowly pour hot cream into egg mixture while whisking constantly.",
        "Strain mixture through fine-mesh sieve into a large measuring cup.",
        "Divide custard among 6 ramekins placed in a deep baking dish.",
        "Pour boiling water into baking dish until it reaches halfway up the ramekins.",
        "Bake for 40-45 minutes until custard is set but still jiggly in center.",
        "Remove from water bath and let cool to room temperature.",
        "Refrigerate for at least 4 hours or overnight.",
        "Before serving, sprinkle thin layer of sugar on top and caramelize with kitchen torch until golden."
      ]
    },
    {
      "id": 10,
      "name": "Mediterranean Quinoa Salad",
      "imageUrl": "https://images.unsplash.com/photo-1623428187969-5da2dcea5ebf?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "category": "lunch",
      "prepTime": 15,
      "cookTime": 20,
      "servings": 4,
      "difficulty": "easy",
      "rating": 4.6,
      "ingredients": [
        "1 ½ cups quinoa",
        "3 cups vegetable broth",
        "1 cucumber, diced",
        "2 cups cherry tomatoes, halved",
        "1 red onion, finely chopped",
        "1 cup Kalamata olives, sliced",
        "200g feta cheese, crumbled",
        "¼ cup olive oil",
        "3 tablespoons lemon juice",
        "Fresh parsley and mint",
        "Salt and pepper to taste"
      ],
      "steps": [
        "Rinse quinoa thoroughly under cold water.",
        "Bring vegetable broth to a boil in a medium saucepan.",
        "Add quinoa, reduce heat to low, cover and simmer for 15-20 minutes.",
        "Remove from heat and let stand covered for 5 minutes, then fluff with fork.",
        "Transfer quinoa to a large bowl and let cool completely.",
        "Add diced cucumber, halved cherry tomatoes, and chopped red onion.",
        "Mix in Kalamata olives and crumbled feta cheese.",
        "In a small bowl, whisk together olive oil, lemon juice, salt, and pepper.",
        "Pour dressing over salad and toss gently to combine.",
        "Add fresh chopped parsley and mint, toss again.",
        "Refrigerate for at least 30 minutes before serving to let flavors meld."
      ]
    },
    {
      "id": 11,
      "name": "Belgian Waffles with Berry Compote",
      "imageUrl": "https://images.unsplash.com/photo-1562376552-0d160a2f238d?w=800&q=80",
      "category": "breakfast",
      "prepTime": 20,
      "cookTime": 20,
      "servings": 6,
      "difficulty": "easy",
      "rating": 4.7,
      "ingredients": [
        "2 cups all-purpose flour",
        "2 tablespoons sugar",
        "1 tablespoon baking powder",
        "½ teaspoon salt",
        "2 large eggs, separated",
        "1 ¾ cups milk",
        "½ cup melted butter",
        "1 teaspoon vanilla extract",
        "2 cups mixed berries",
        "¼ cup sugar for compote",
        "Whipped cream for serving"
      ],
      "steps": [
        "Preheat your Belgian waffle iron according to manufacturer's instructions.",
        "In a large bowl, whisk together flour, sugar, baking powder, and salt.",
        "In another bowl, whisk egg yolks, milk, melted butter, and vanilla.","Pour wet ingredients into dry ingredients and mix until just combined.",
        "In a clean bowl, beat egg whites until stiff peaks form.",
        "Gently fold beaten egg whites into batter in three additions.",
        "For compote: simmer berries with sugar in a saucepan for 10 minutes until thickened.",
        "Spray waffle iron with non-stick spray and pour in batter (amount depends on your iron).",
        "Cook until golden brown and crispy (about 4-5 minutes).",
        "Serve hot waffles topped with warm berry compote and whipped cream."
      ]
    },
    {
      "id": 12,
      "name": "Japanese Teriyaki Chicken Bowl",
      "imageUrl": "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&q=80",
      "category": "dinner",
      "prepTime": 15,
      "cookTime": 25,
      "servings": 4,
      "difficulty": "easy",
      "rating": 4.7,
      "ingredients": [
        "600g chicken thighs, boneless",
        "½ cup soy sauce",
        "¼ cup mirin",
        "¼ cup sake",
        "3 tablespoons brown sugar",
        "2 cloves garlic, minced",
        "1 tablespoon ginger, grated",
        "2 cups cooked white rice",
        "1 tablespoon sesame oil",
        "Sesame seeds and green onions for garnish"
      ],
      "steps": [
        "Cut chicken thighs into bite-sized pieces.",
        "In a bowl, mix soy sauce, mirin, sake, brown sugar, garlic, and ginger.",
        "Marinate chicken in half of the teriyaki sauce for 15 minutes.",
        "Heat sesame oil in a large skillet over medium-high heat.",
        "Remove chicken from marinade and cook until golden brown (about 5-6 minutes per side).",
        "Pour remaining teriyaki sauce into the pan and bring to a simmer.",
        "Cook for another 5-7 minutes, letting sauce reduce and glaze the chicken.",
        "The sauce should become thick and glossy.",
        "Serve chicken over steamed white rice.",
        "Drizzle with extra teriyaki glaze from the pan.",
        "Garnish with sesame seeds and sliced green onions."
      ]
    }
  ];

  static Future<List<Recipe>> getAllRecipes() async {
    await Future.delayed(Duration(milliseconds: 800));
    return fakeApiData.map((json) => Recipe.fromJson(json)).toList();
  }

  static Future<List<Recipe>> getRecipesByCategory(String category) async {
    await Future.delayed(Duration(milliseconds: 500));
    var filteredData = fakeApiData
        .where((recipe) => recipe['category'] == category)
        .toList();
    return filteredData.map((json) => Recipe.fromJson(json)).toList();
  }

  static List<String> getCategories() {
    return ['all', 'breakfast', 'lunch', 'dinner', 'dessert'];
  }
}