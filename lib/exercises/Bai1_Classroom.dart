import 'package:flutter/material.dart';

//stl -> viết tắt
class Classroom extends StatelessWidget {
  const Classroom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(10, (index) => itemClass()),
    );
  }

  Widget itemClass() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              //border: Border.all(color: Colors.black),
              color: const Color.fromARGB(255, 119, 233, 52),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "XML và ứng dụng - Nhóm 1",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "2025-2026.1.TIN4583.001",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 12),
                    Text("45 Học viên"),
                  ],
                ),

                IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
