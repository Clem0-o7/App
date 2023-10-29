import 'package:flutter/material.dart';

class MealItemPage extends StatefulWidget {
  final String mealName;
  final List<String> foodItems;

  MealItemPage({
    required this.mealName,
    required this.foodItems,
    required Map<String, String> tasteRatings,
    required Map<String, String> qualityRatings,
  });

  @override
  _MealItemPageState createState() => _MealItemPageState();
}

class _MealItemPageState extends State<MealItemPage> {
  final Map<String, String> tasteRatings = {};
  final Map<String, String> qualityRatings = {};
  final List<String> favoriteItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mealName),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Meal Items', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          for (int i = 0; i < widget.foodItems.length; i++)
            ListTile(
              title: Text(widget.foodItems[i]),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text('Taste', textAlign: TextAlign.center),
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          value: tasteRatings[widget.foodItems[i]] ?? 'Excellent',
                          items: ['Excellent', 'Good', 'Average', 'Poor', 'Worst']
                              .map((rating) => DropdownMenuItem<String>(
                                    value: rating,
                                    child: Text(rating),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              tasteRatings[widget.foodItems[i]] = value ?? 'Excellent';
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text('Quality', textAlign: TextAlign.center),
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          value: qualityRatings[widget.foodItems[i]] ?? 'Excellent',
                          items: ['Excellent', 'Good', 'Average', 'Poor', 'Worst']
                              .map((rating) => DropdownMenuItem<String>(
                                    value: rating,
                                    child: Text(rating),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              qualityRatings[widget.foodItems[i]] = value ?? 'Excellent';
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    if (favoriteItems.contains(widget.foodItems[i])) {
                      favoriteItems.remove(widget.foodItems[i]);
                    } else {
                      favoriteItems.add(widget.foodItems[i]);
                    }
                  });
                },
                child: Icon(
                  favoriteItems.contains(widget.foodItems[i])
                      ? Icons.star
                      : Icons.star_border,
                  color: favoriteItems.contains(widget.foodItems[i])
                      ? Colors.yellow
                      : null,
                ),
              ),
            ),
          Center(
            child: Text(
              'Final Rating: ${calculateFinalRating().toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  double calculateFinalRating() {
    double totalTasteRating = 0;
    double totalQualityRating = 0;

    for (int i = 0; i < widget.foodItems.length; i++) {
      final tasteRating = tasteRatings[widget.foodItems[i]] ?? 'Excellent';
      final qualityRating = qualityRatings[widget.foodItems[i]] ?? 'Excellent';

      totalTasteRating += mapRatingToValue(tasteRating);
      totalQualityRating += mapRatingToValue(qualityRating);
    }

    final finalRating = (totalTasteRating + totalQualityRating) / (widget.foodItems.length * 2);
    return finalRating;
  }

  double mapRatingToValue(String rating) {
    switch (rating) {
      case 'Excellent':
        return 5.0;
      case 'Good':
        return 4.0;
      case 'Average':
        return 3.0;
      case 'Poor':
        return 2.0;
      case 'Worst':
        return 1.0;
      default:
        return 0.0;
    }
  }
}
