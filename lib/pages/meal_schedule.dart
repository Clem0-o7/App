import 'package:flutter/material.dart';
import 'meal_item.dart'; // Import the meal_item.dart file

class MealSchedulePage extends StatefulWidget {
  @override
  _MealSchedulePageState createState() => _MealSchedulePageState();
}

class _MealSchedulePageState extends State<MealSchedulePage> {
   final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  int currentDayIndex = 0; // Index of the current day (0 is Monday)

  // Define meal options for each day and meal
  final Map<String, Map<String, List<String>>> mealOptions = {
    'Monday': {
      'Breakfast': ['Dosa', 'Milk', 'Banana'],
      'Lunch': ['Biryani', 'French fries', 'Curd rice'],
      'Evening Snack': ['Yogurt', 'Pulses'],
      'Dinner': ['Chapati', 'Channa gravy', 'Salad'],
    },
    'Tuesday': {
      'Breakfast': ['White pongal ','Bread', 'Nuts'],
      'Lunch': ['White rice', 'Sambar','Steamed Vegetables' ],
      'Evening Snack': ['Biscuits', 'Peanut Butter'],
      'Dinner': ['Parotta','Veg kuruma','Milk'],
    },
    'Wednesday': {
      'Breakfast': ['Rava Upma', 'Sandwich'],
      'Lunch': ['Fried rice', 'French Fries', ],
      'Evening Snack': ['Mixture', 'Milk'],
      'Dinner': ['Idiyappam', 'Veg kuruma'],
    },
    'Thursday': {
      'Breakfast': ['Idly','Cereal', 'Milk'],
      'Lunch': ['Rice', 'Rasam' , 'Steamed Vegetables'],
      'Evening Snack': ['Maggie' , 'Milk'],
      'Dinner': ['Poori' , 'Paneer gravy'],
    },
    'Friday': {
      'Breakfast': ['Chapati' , 'bread'],
      'Lunch': ['White rice', 'Steamed Vegetables', 'Sambar'],
      'Evening Snack': ['Vegetable salad', 'Milk'],
      'Dinner': ['Dosa','Fruits'],
    },
    'Saturday': {
      'Breakfast': ['Dosa', 'Corn Flakes'],
      'Lunch': ['Pulav','Paneer gravy' ],
      'Evening Snack': ['Samosa','Milk'],
      'Dinner': ['Idly','Chutny'],
    },
    'Sunday': {
      'Breakfast': ['Poori','Banana','Milk'],
      'Lunch': ['Mushroom Biryani', 'Curd Rice'],
      'Evening Snack': ['Sandwich','Milk'],
      'Dinner': ['Fruits', 'Milk', 'Salad'],
    },
    // Add meal options for the remaining days...
  };

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Meal Schedule'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    currentDayIndex = (currentDayIndex - 1) % 7;
                    if (currentDayIndex < 0) {
                      currentDayIndex = 6; // Wrap around to Sunday
                    }
                  });
                },
              ),
              Text(
                daysOfWeek[currentDayIndex],
                style: TextStyle(fontSize: 20),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  setState(() {
                    currentDayIndex = (currentDayIndex + 1) % 7;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: MealList(
              currentDayIndex: currentDayIndex,
              mealOptions: mealOptions,
              daysOfWeek: daysOfWeek,
            ),
          ),
        ],
      ),
    );
  }
}

class MealList extends StatelessWidget {
  final int currentDayIndex;
  final Map<String, Map<String, List<String>>> mealOptions;
  final List<String> daysOfWeek;

  MealList({
    required this.currentDayIndex,
    required this.mealOptions,
    required this.daysOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    final currentDay = daysOfWeek[currentDayIndex];
    final currentMealOptions = mealOptions[currentDay];

    return ListView.builder(
      itemCount: currentMealOptions?.length ?? 0,
      itemBuilder: (context, index) {
        final meal = currentMealOptions?.keys.elementAt(index);
        final foodItems = currentMealOptions?[meal] ?? [];
        final mealName = meal ?? '';
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MealItemPage(
                  mealName: mealName,
                  foodItems: foodItems, tasteRatings: {}, qualityRatings: {},
                ),
              ),
            );
          },
          child: ListTile(
            title: Text(mealName),
            subtitle: Text(foodItems.join(', ')),
          ),
        );
      },
    );
  }
}