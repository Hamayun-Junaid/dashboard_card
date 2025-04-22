import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardCardData {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String details;

  DashboardCardData({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.details,
  });
}

class DashboardScreen extends StatelessWidget {
  final List<DashboardCardData> cards = [
    DashboardCardData(
      title: 'Users',
      value: '1200',
      icon: Icons.people,
      color: Colors.blue,
      details: '1200 users are currently active.',
    ),
    DashboardCardData(
      title: 'Messages',
      value: '350',
      icon: Icons.message,
      color: Colors.green,
      details: 'You have 350 unread messages.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: cards
              .map((card) => Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: DashboardCard(cardData: card),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final DashboardCardData cardData;

  DashboardCard({required this.cardData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text(cardData.title),
            content: Text(cardData.details),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
              )
            ],
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 200,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cardData.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(
              cardData.icon,
              size: 40,
              color: cardData.color,
            ),
            SizedBox(height: 10),
            Text(
              cardData.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              cardData.value,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
