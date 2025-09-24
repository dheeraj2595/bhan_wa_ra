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
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: "New note",
          ),
        ],
      ),
    );
  }
}
