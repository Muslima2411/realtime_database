import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realtime_database/models/my_model.dart';
import 'package:realtime_database/service/realtime_database_service.dart';

import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel>? listOfNotes;

  bool descending = false;

  Color txtColor = const Color(0xFF646464);

  void read() async {
    await RTDBService.readData();
    print("all data was loaded");
  }

  @override
  void initState() {
    read();
    print("initialized");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            "Recent Notes",
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                descending = !descending;
                print("descending = $descending");
                // loadNotes();
              });
            },
            icon: const Icon(CupertinoIcons.arrow_up_arrow_down),
          )
        ],
      ),
      // body: Padding(
      //     padding: const EdgeInsets.all(15.0),
      //     child: MasonryGridView.builder(
      //       itemCount: CFSService.documents.length,
      //       gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2),
      //       itemBuilder: (BuildContext context, int index) {
      //         var item = CFSService.documents[index];
      //         return Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: _buildCard(
      //               color: Colorful.colors[index], data: item.data()),
      //         );
      //       },
      //     )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => DetailsPage()),
          );
          setState(() {});
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
