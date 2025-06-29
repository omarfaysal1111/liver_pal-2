import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(height: 80, child: Image.asset("assets/logo.png")),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text("""1. 🥗 Quinoa Salad with Vegetables and Olive Oil
      Ingredients:
      
      ½ cup quinoa (rinsed)
      
      Chopped cucumber, tomato, parsley, bell peppers, green onion
      
      Lemon juice + 1 tsp olive oil
      
      Benefits: High in fiber and plant protein, very liver-friendly.
      
      2. 🍲 Vegetable Lentil Soup
      Ingredients:
      
      1 cup red lentils
      
      Carrots, potatoes, celery, onion, zucchini
      
      Cumin, turmeric, low salt
      
      Instructions: Boil, blend, and serve warm.
      
      Benefits: Easy to digest, high in fiber and nutrients.
      
      3. 🐟 Herb-Grilled Fish Fillet
      Ingredients:
      
      One fillet (tilapia, bream, or salmon)
      
      Lemon juice + crushed garlic + rosemary + olive oil
      
      Instructions: Marinate and grill or bake in the oven.
      
      Benefits: Rich in omega-3, low in fat, easy on the liver.
      
      4. 🥤 Liver Detox Smoothie (No Sugar)
      Ingredients:
      
      1 cucumber + fresh mint + 1 green apple + ½ lemon + cold water
      
      Instructions: Blend all and drink fresh.
      
      Benefits: Refreshing and supportive for liver detox.
      
      5. 🍠 Baked Sweet Potato with Yogurt
      Ingredients:
      
      Baked sweet potato
      
      Low-fat yogurt + dried mint or cumin
      
      Benefits: Light, nutritious, and satisfying.
      """),
        ),
      ),
    );
  }
}
