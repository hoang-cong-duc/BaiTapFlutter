import 'package:flutter/material.dart';
import 'dart:math';

class Count extends StatelessWidget {
  const Count({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;
  Color randomTextColor = Colors.black; 

  void changeTextColor() {
    final random = Random();
    randomTextColor = Colors.primaries[random.nextInt(Colors.primaries.length)];
  }

  Color get textColor {
    return randomTextColor;
  }

  void increase() {
    setState(() {
      count++;
      changeTextColor(); 
    });
  }

  void decrease() {
    setState(() {
      count--;
      changeTextColor(); 
    });
  }

  void reset() {
    setState(() {
      count = 0;
      randomTextColor = Colors.black; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ứng dụng Đếm số"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Giá trị hiện tại:",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 10),
          Text(
            "$count",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: textColor, 
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: decrease,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Giảm"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: reset,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text("Đặt lại"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: increase,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Tăng"),
              ),
],
          ),
        ],
      ),
    );
  }
}