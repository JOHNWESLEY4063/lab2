import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Report',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather Report',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            MyWeatherItem(
              weather: 'Sunny',
              url: 'assets/images/1.jpg',
              temparature: 35.5,
              country: 'India',
            ),
            MyWeatherItem(
              weather: 'Cloudy',
              url: 'assets/images/2.jpg',
              temparature: 28.0,
              country: 'England',
            ),
            MyWeatherItem(
              weather: 'Rainy',
              url: 'assets/images/3.jpg',
              temparature: 22.7,
              country: 'Japan',
            ),
            MyWeatherItem(
              weather: 'Snow',
              url: 'assets/images/4.jpg',
              temparature: -5.0,
              country: 'Russia',
            ),
            MyWeatherItem(
              weather: 'Windy',
              url: 'assets/images/5.jpg',
              temparature: 18.3,
              country: 'Canada',
            ),
          ],
        ),
      ),
    );
  }
}

class MyWeatherItem extends StatelessWidget {
  final String weather, url, country;
  final double temparature;
  MyWeatherItem({
    super.key,
    required this.weather,
    required this.url,
    required this.temparature,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.limeAccent, width: 0.5),
      ),
      elevation: 1,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            color: Colors.lightBlueAccent,
            width: 200,
            height: 200,
            child: Image.asset(
              url,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(weather,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(height: 20),
              Text(
                  "${temparature}°C",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(height: 20),
              Text(country,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 25, 65, 1),
                    foregroundColor: Colors.white,
                  ),
                  child: Text("See Details")),
            ],
          )
        ],
      ),
    );
  }
}
