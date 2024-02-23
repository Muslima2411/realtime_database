import 'package:flutter/material.dart';

import '../service/realtime_database_service.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  void store() async {
    await RTDBService.storeData(
      data: {
        "title": title.text,
        "description": description.text,
      },
    );
    print("Stored succeesfully");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF3BF),
      appBar: AppBar(
          backgroundColor: const Color(0xFFFDF3BF),
          title: const Center(
            child: Text("New Note"),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.done_rounded,
                size: 27,
              ),
              onPressed: () {
                store();
                print("saved");
              },
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.more_vert,
              size: 27,
            ),
            const SizedBox(
              width: 10,
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(
          children: [
            Expanded(
              flex: 1,
              child: TextField(
                style: const TextStyle(
                  fontSize: 24, // Set the font size
                  fontWeight: FontWeight.bold, // Set the font weight
                ),
                controller: title,
                maxLength: 15,
                decoration: const InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent), // No border when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Colors.transparent), // No border when not focused
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: TextField(
                controller: description,
                maxLength: 500,
                maxLines: 25,
                decoration: const InputDecoration(
                  hintText: "Description",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent), // No border when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Colors.transparent), // No border when not focused
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
