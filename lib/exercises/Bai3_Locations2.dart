import 'package:flutter/material.dart';

class Locations2 extends StatelessWidget {
  const Locations2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            const SizedBox(height: 10), 
            TitleSection(),
            Search(),
            Expanded(child: GridViewSection()),
          ],
        ),
      ),
    );
  }

  Widget Header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Icon(Icons.notifications),
        SizedBox(width: 8),
        Icon(Icons.person),
      ],
    );
  }

  Widget TitleSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome,",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text("Charlie", style: TextStyle(fontSize: 28)),
      ],
    );
  }

  Widget Search() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.blue),
          hintText: "Search",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget GridViewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Saved Places",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              buildImage("assets/images/1.jpg"),
              buildImage("assets/images/2.jpg"),
              buildImage("assets/images/3.jpg"),
              buildImage("assets/images/4.jpg"),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildImage(String path) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(path), 
          fit: BoxFit.cover
        ),
      ),
    );
  }
}