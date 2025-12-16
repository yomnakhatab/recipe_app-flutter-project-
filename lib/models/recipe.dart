class Recipe {
  final int id;
  final String name;
  final String imageUrl;
  final String category;
  final List<String> ingredients;
  final List<String> steps;
  final int prepTime; // in minutes
  final int cookTime; // in minutes
  final int servings;
  final String difficulty; // easy, medium, hard
  final double rating;

  Recipe({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.ingredients,
    required this.steps,
    required this.prepTime,
    required this.cookTime,
    required this.servings,
    required this.difficulty,
    required this.rating,
  });

  int get totalTime => prepTime + cookTime;

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      category: json['category'],
      ingredients: List<String>.from(json['ingredients']),
      steps: List<String>.from(json['steps']),
      prepTime: json['prepTime'],
      cookTime: json['cookTime'],
      servings: json['servings'],
      difficulty: json['difficulty'],
      rating: json['rating'].toDouble(),
    );
  }
}