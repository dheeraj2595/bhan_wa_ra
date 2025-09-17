import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewNote extends StatelessWidget {
  const NewNote({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          ' - भँवरा - ',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontFamily: 'Poppins',
            fontSize: MediaQuery.of(context).size.width * 0.08,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.onPrimary,
                    Theme.of(context).colorScheme.primary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Hive",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.sticky_note_2_outlined)),
              title: Text("All notes"),
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.category_outlined)),
              title: Text("Categories"),
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.lock_clock_outlined)),
              title: Text("Vault"),
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.bar_chart_outlined)),
              title: Text("Memory statistics"),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Username"),
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search_outlined),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 3,
            indent: 5,
            endIndent: 5,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: TextField(
                  controller: contentController,
                  decoration: const InputDecoration(
                    hintText: 'Start typing your note...',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
