import 'package:bhan_wa_ra/note_state.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:bhan_wa_ra/pages/category_list.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key, required this.title});

  final String title;

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  @override
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  String selectedCategory = "Anaesthesia";

  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Provider.of<NoteState>(context, listen: false).addNewNote(
                      titleController.text,
                      contentController.text,
                      selectedCategory,
                    );
                  },
                  icon: Icon(Icons.note_add),
                  label: Text("Save"),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Builder(
                  builder: (context) {
                    return FloatingActionButton.extended(
                      onPressed: () {
                        context.read<pageChangeState>().selectCategory();
                      },
                      icon: Icon(Icons.category_sharp),
                      label: Text("Category - $selectedCategory"),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
