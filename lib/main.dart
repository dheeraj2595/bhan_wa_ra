import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'pages/categories.dart';
import 'pages/vault.dart';
import 'pages/new_note.dart';
import 'package:bhan_wa_ra/note_state.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NoteState())],
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
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<WidgetBuilder> pages = [
    (context) => MyHomePage(title: 'home'),
    (context) => CategoryPage(title: 'category'),
    (context) => VaultPage(title: 'vault'),
    (context) => NewNote(title: 'New note'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.category_outlined)),
              title: Text("Categories"),
              onTap: () {
                _onItemTapped(1);

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.lock_clock_outlined)),
              title: Text("Vault"),
              onTap: () {
                _onItemTapped(3);
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
      body: pages[_selectedIndex](context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
