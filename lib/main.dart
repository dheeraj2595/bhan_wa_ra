import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'pages/categories.dart';
import 'pages/vault.dart';
import 'pages/new_note.dart';
import 'package:bhan_wa_ra/note_state.dart';
import 'package:bhan_wa_ra/pages/category_list.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NoteState()),
        ChangeNotifierProvider(create: (_) => CategoryState()),
        ChangeNotifierProvider(create: (_) => PageChangeState()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bhan -Wa -Ra',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Color(0xFFFFC30B), // bee yellow
          onPrimary: Colors.black, // text/icon color on top of yellow
          secondary: Colors.black, // for contrast
        ),
      ),
      home: MainPage(),
      routes: {
        '/home': (context) => MyHomePage(title: 'home'),
        '/category': (context) => CategoryPage(title: 'category'),
        '/new-note': (context) => NewNote(title: 'New note'),
        '/vault': (context) => VaultPage(title: 'vault'),
        '/all-categories': (context) =>
            CategoryListPage(title: 'All categories'),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageChange = context.watch<PageChangeState>();
    final selectedIndex = pageChange.selectedIndex;
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
              onTap: () {
                pageChange.onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.category_outlined)),
              title: Text("Categories"),
              onTap: () {
                pageChange.onItemTapped(1);

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.category_outlined)),
              title: Text("All categories"),
              onTap: () {
                pageChange.onItemTapped(4);

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.lock_clock_outlined)),
              title: Text("Vault"),
              onTap: () {
                pageChange.onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.bar_chart_outlined)),
              title: Text("Memory statistics"),
            ),
          ],
        ),
      ),
      body: pageChange.pages[selectedIndex](context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex > 2 ? 0 : selectedIndex,
        onTap: pageChange.onItemTapped,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.notes), label: "notes"),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: "category",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "New note"),
        ],
      ),
    );
  }
}
