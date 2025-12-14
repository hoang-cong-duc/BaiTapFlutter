import 'package:flutter/material.dart';
import 'dart:math';


class Changercolor extends StatelessWidget {
  const Changercolor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeColorApp(),
    );
  }
}

class ChangeColorApp extends StatefulWidget {
  ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  Color bgColor = Colors.pink;
  String bgColorString = "Hồng";

  List<Color> listColor = [
    Colors.black,
    Colors.red,
    Colors.pink,
    Colors.green,
    Colors.purple,
    Colors.blue
  ];

  List<String> listColorString = [
    "Đen",
    "Đỏ",
    "Hồng",
    "Xanh lá",
    "Tím",
    "Xanh dương"
  ];

  // 👉 Hàm đổi màu ngẫu nhiên
  void _ChangerColor() {
    var random = Random();
    int index = random.nextInt(listColor.length);

    setState(() {
      bgColor = listColor[index];
      bgColorString = listColorString[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ứng dụng đổi màu nền"),
        backgroundColor: const Color.fromARGB(255, 62, 147, 216),
        centerTitle: true,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Màu hiện tại:",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          Text(
            bgColorString,
            style: const TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: _ChangerColor,
            child: const Text("Đổi màu"),
          )
        ],
      ),
    );
  }
}