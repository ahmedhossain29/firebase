import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'detailsPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

  // Future<void> initializeDefault() async {
  //   FirebaseApp app = await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MatchList(),
    );
  }
}

class MatchList extends StatefulWidget {
  const MatchList({super.key});

  @override
  State<MatchList> createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<Football> footballList = [];

  Future<void> getfootballMatch() async {
    final QuerySnapshot result =
        await firebaseFirestore.collection('football').get();
    for (QueryDocumentSnapshot element in result.docs) {
      Football football = Football(element.get('teamName'),
          element.get('goals'), element.get('time'), element.get('totalTime'));
      footballList.add(football);
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getfootballMatch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match List'),
      ),
      body: ListView.builder(
          itemCount: footballList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                  matchList: footballList[index],
                                )));
                  },
                  title: Text(
                    footballList[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward),
                ),
              ),
            );
          }),
    );
  }
}

class Football {
  final String name;
  final String goal;
  final String time;
  final String totalTime;

  Football(this.name, this.goal, this.time, this.totalTime);
}
