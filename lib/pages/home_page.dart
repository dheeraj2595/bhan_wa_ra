import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

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
                Text("Username"),
                Spacer(),
                Icon(Icons.search_outlined),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
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
                      child: InkWell(
                        onTap: () {
                          Text("Card tapped");
                        },
                        child: Text(
                          "Note ${index + 1}", // shows Note 1, Note 2...
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
