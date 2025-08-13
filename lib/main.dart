import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> weatherData = [
      {
        'weather': 'Sunny',
        'imageurl': 'assets/images/1.jpg',
        'temperature': 35.0,
        'country': 'India',
      },
      {
        'weather': 'Cloudy',
        'imageurl': 'assets/images/2.jpg',
        'temperature': 22.0,
        'country': 'UK',
      },
      {
        'weather': 'Rainy',
        'imageurl': 'assets/images/3.jpg',
        'temperature': 18.5,
        'country': 'Brazil',
      },
      {
        'weather': 'Stormy',
        'imageurl': 'assets/images/4.jpg',
        'temperature': 15.0,
        'country': 'USA',
      },
      {
        'weather': 'Snowy',
        'imageurl': 'assets/images/5.jpg',
        'temperature': -2.0,
        'country': 'Canada',
      },
      {
        'weather': 'Windy',
        'imageurl': 'assets/images/6.jpg',
        'temperature': 25.0,
        'country': 'Australia',
      },
    ];

    return MaterialApp(
      title: "Daily Weather Report",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather Report',
            style: TextStyle(fontSize: 20, letterSpacing: 12),
          ),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            ...weatherData.map((item) => MyListItem(
                  weather: item['weather'],
                  imageurl: item['imageurl'],
                  temperature: item['temperature'],
                  country: item['country'],
                )),
          ],
        ),
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  final String weather, imageurl, country;
  final double temperature;
  const MyListItem({
    super.key,
    required this.weather,
    required this.imageurl,
    required this.temperature,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.red, width: 0.5),
      ),
      elevation: 1,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(13),
            color: Colors.grey[200],
            width: 200,
            height: 200,
            child: Image.asset(imageurl, width: 160, height: 150, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weather,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '${temperature.toStringAsFixed(1)}°C',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // You can add your desired action here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Country: $country')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      country,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
