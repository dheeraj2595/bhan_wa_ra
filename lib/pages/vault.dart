import 'package:flutter/material.dart';

class VaultPage extends StatelessWidget {
  const VaultPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
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
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200, // 2 columns
                  crossAxisSpacing: 15.0, // space between columns
                  mainAxisSpacing: 15.0, // space between rows
                  childAspectRatio: 0.8, // note card height vs width
                ),
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.all(10.00),
                    elevation: 15,
                    child: Ink(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 240, 234),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Card ${index + 1} tapped")),
                          );
                        },
                        child: SizedBox.expand(
                          child: Center(
                            child: Text(
                              "Note ${index + 1}", // shows Note 1, Note 2...
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
