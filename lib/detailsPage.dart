import 'package:firebase/main.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Football matchList;
  const DetailsPage({
    super.key,
    required this.matchList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(matchList.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 150,
          width: double.infinity,
          child: Card(
            elevation: 1,
            child: Column(
              children: [
                Text(
                  matchList.name,
                  style: const TextStyle(fontSize: 25),
                ),
                Text(
                  matchList.goal,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Time: ${matchList.time}',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  'Total Time: ${matchList.totalTime}',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
