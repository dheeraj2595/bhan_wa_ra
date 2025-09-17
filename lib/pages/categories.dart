import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.access_alarm),
                    title: Text("Item ${index + 1}"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
