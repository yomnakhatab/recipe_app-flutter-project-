import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/recipe_service.dart';
import 'recipe_detail_screen.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> recipes = [];
  List<Recipe> filteredRecipes = [];
  bool isLoading = true;
  String selectedCategory = 'all';

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  Future<void> loadRecipes() async {
    setState(() => isLoading = true);
    
    var data = await RecipeService.getAllRecipes();
    
    setState(() {
      recipes = data;
      filteredRecipes = data;
      isLoading = false;
    });
  }

  void filterRecipes(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'all') {
        filteredRecipes = recipes;
      } else {
        filteredRecipes = recipes
            .where((recipe) => recipe.category == category)
            .toList();
      }
    });
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return Color(0xFF10B981);
      case 'medium':
        return Color(0xFFF59E0B);
      case 'hard':
        return Color(0xFFEF4444);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EFE6),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Compact Header Section
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 16),
                decoration: BoxDecoration(
                  color: Color(0xFF3D5A80),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title only - removed recipe count
                    Text(
                      'Discover Amazing Recipes',
                      style: TextStyle(
                        color: Color(0xFFF5EFE6),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 16),
                    
                    // Categories - Horizontal Scroll with proper physics
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          SizedBox(width: 4),
                          FilterButton(
                            label: 'All',
                            isSelected: selectedCategory == 'all',
                            onTap: () => filterRecipes('all'),
                            icon: Icons.restaurant_menu,
                          ),
                          SizedBox(width: 8),
                          FilterButton(
                            label: 'Breakfast',
                            isSelected: selectedCategory == 'breakfast',
                            onTap: () => filterRecipes('breakfast'),
                            icon: Icons.breakfast_dining,
                          ),
                          SizedBox(width: 8),
                          FilterButton(
                            label: 'Lunch',
                            isSelected: selectedCategory == 'lunch',
                            onTap: () => filterRecipes('lunch'),
                            icon: Icons.lunch_dining,
                          ),
                          SizedBox(width: 8),
                          FilterButton(
                            label: 'Dinner',
                            isSelected: selectedCategory == 'dinner',
                            onTap: () => filterRecipes('dinner'),
                            icon: Icons.dinner_dining,
                          ),
                          SizedBox(width: 8),
                          FilterButton(
                            label: 'Dessert',
                            isSelected: selectedCategory == 'dessert',
                            onTap: () => filterRecipes('dessert'),
                            icon: Icons.cake,
                          ),
                          SizedBox(width: 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Recipe List
            isLoading
                ? SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF3D5A80),
                              ),
                              strokeWidth: 5,
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            'Loading delicious recipes...',
                            style: TextStyle(
                              color: Color(0xFF3D5A80),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : filteredRecipes.isEmpty
                    ? SliverFillRemaining(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 100,
                                color: Color(0xFF98A8B8),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'No recipes found',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3D5A80),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Try a different category',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF98A8B8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SliverPadding(
                        padding: EdgeInsets.all(20),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final recipe = filteredRecipes[index];
                              return TweenAnimationBuilder<double>(
                                duration: Duration(milliseconds: 300 + (index * 50)),
                                tween: Tween(begin: 0.0, end: 1.0),
                                builder: (context, value, child) {
                                  return Transform.translate(
                                    offset: Offset(0, 20 * (1 - value)),
                                    child: Opacity(
                                      opacity: value,
                                      child: child,
                                    ),
                                  );
                                },
                                child: RecipeCard(
                                  recipe: recipe,
                                  difficultyColor: _getDifficultyColor(recipe.difficulty),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation, secondaryAnimation) =>
                                            RecipeDetailScreen(recipe: recipe),
                                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            childCount: filteredRecipes.length,
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}

// Filter Button Widget
class FilterButton extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData icon;

  FilterButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.icon,
  });

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: widget.isSelected ? Color(0xFFF5EFE6) : Color(0xFF4A6FA5),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.isSelected ? Color(0xFFF5EFE6) : Color(0xFF5B7FA8),
              width: 2,
            ),
            boxShadow: widget.isSelected
                ? [
                    BoxShadow(
                      color: Color(0xFFF5EFE6).withOpacity(0.4),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: widget.isSelected ? Color(0xFF3D5A80) : Color(0xFFF5EFE6),
                size: 18,
              ),
              SizedBox(width: 6),
              Text(
                widget.label,
                style: TextStyle(
                  color: widget.isSelected ? Color(0xFF3D5A80) : Color(0xFFF5EFE6),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Recipe Card Widget - Fixed Image Display
class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  final VoidCallback onTap;
  final Color difficultyColor;

  RecipeCard({
    required this.recipe,
    required this.onTap,
    required this.difficultyColor,
  });

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String getCategoryName(String category) {
    switch (category) {
      case 'breakfast':
        return 'Breakfast';
      case 'lunch':
        return 'Lunch';
      case 'dinner':
        return 'Dinner';
      case 'dessert':
        return 'Dessert';
      default:
        return category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: 1.0 - (_controller.value * 0.03),
            child: child,
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF3D5A80).withOpacity(0.15),
                blurRadius: 15,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe Image - 100% Fixed
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    child: Hero(
                      tag: 'recipe-${widget.recipe.id}',
                      child: Container(
                       height: 350, // ارتفاع ثابت
  width: double.infinity, // عرض كامل
  child: Image.network(
    widget.recipe.imageUrl,
    fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: Color(0xFF3D5A80).withOpacity(0.1),
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF3D5A80),
                                  ),
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFF3D5A80), Color(0xFF4A6FA5)],
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.restaurant,
                                  size: 80,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  // Category Badge
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFF3D5A80),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        getCategoryName(widget.recipe.category),
                        style: TextStyle(
                          color: Color(0xFFF5EFE6),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  // Rating Badge
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5EFE6),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Color(0xFFF59E0B), size: 16),
                          SizedBox(width: 4),
                          Text(
                            widget.recipe.rating.toString(),
                            style: TextStyle(
                              color: Color(0xFF3D5A80),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              // Recipe Info
              Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.recipe.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3D5A80),
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 14),
                    
                    // Info Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InfoChip(
                            icon: Icons.access_time_rounded,
                            label: '${widget.recipe.totalTime}m',
                            color: Color(0xFF3D5A80),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: InfoChip(
                            icon: Icons.restaurant_rounded,
                            label: '${widget.recipe.servings} srv',
                            color: Color(0xFF3D5A80),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: InfoChip(
                            icon: Icons.speed_rounded,
                            label: widget.recipe.difficulty,
                            color: widget.difficultyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Info Chip Widget
class InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  InfoChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 18),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}