import 'package:bhan_wa_ra/note_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final noteState = context.watch<NoteState>();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Username"),
                Spacer(),
                Icon(Icons.search_outlined),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: noteState.notes.isEmpty
                  ? Center(child: Text("No notes yet"))
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200, // 2 columns
                        crossAxisSpacing: 15.0, // space between columns
                        mainAxisSpacing: 15.0, // space between rows
                        childAspectRatio: 0.8, // note card height vs width
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10.00),
                          elevation: 15,
                          color: const Color.fromARGB(255, 243, 240, 234),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      noteState.notes[index].title,
                                      style: TextStyle(
                                        color: Colors.yellow[800],
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                            0.055,
                                      ),
                                    ),
                                    Divider(),
                                    Text(
                                      noteState.notes[index].content,
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                            0.025,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: noteState.notes.length,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
