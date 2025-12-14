import 'dart:async';
import 'package:flutter/material.dart';



class Time extends StatelessWidget {
  const Time({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CountdownTimerApp(),
    );
  }
}

class CountdownTimerApp extends StatefulWidget {
  const CountdownTimerApp({super.key});

  @override
  State<CountdownTimerApp> createState() => _CountdownTimerAppState();
}

class _CountdownTimerAppState extends State<CountdownTimerApp> {
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _isRunning = false;
  String message = '';

  void startTimer() {
    if (_controller.text.isEmpty) return;

    setState(() {
      _remainingSeconds = int.tryParse(_controller.text) ?? 0;
      message = '';
      _isRunning = true;
    });

    _timer?.cancel(); // hủy nếu đang chạy
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          _isRunning = false;
          message = "⏰ Hết thời gian!";
        });
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void resetTimer() {
    _timer?.cancel();
    setState(() {
      _remainingSeconds = 0;
      _isRunning = false;
      message = '';
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // tránh rò rỉ bộ nhớ
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🕒 Bộ đếm thời gian"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Nhập số giây cần đếm:", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Ví dụ: 10",
              ),
            ),
            const SizedBox(height: 30),
            Text(
              formatTime(_remainingSeconds),
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              message,
style: const TextStyle(fontSize: 22, color: Colors.red),
),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? null : startTimer,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Bắt đầu"),
                ),
               
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: resetTimer,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Đặt lại"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }
}