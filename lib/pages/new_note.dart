import 'package:bhan_wa_ra/note_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_quill/flutter_quill.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key, required this.title});

  final String title;

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  @override
  Widget build(BuildContext context) {
    String selectedCategory = context.read<CategoryState>().selectedCategory;
    var titleController = context.read<PageChangeState>().titleController;
    var contentController = context.read<PageChangeState>().contentController;

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
          QuillSimpleToolbar(
            controller: contentController,
            config: const QuillSimpleToolbarConfig(multiRowsDisplay: false),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: QuillEditor.basic(
                controller: contentController,
                config: QuillEditorConfig(
                  placeholder: 'Note goes here...',
                  scrollable: true,
                  autoFocus: true,
                  expands: true,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Provider.of<NoteState>(context, listen: false).addNewNote(
                        titleController.text,
                        contentController.document.toPlainText(),
                        selectedCategory,
                      );
                    },
                    icon: Icon(Icons.note_alt_rounded),
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
                          context.read<PageChangeState>().selectCategory();
                        },
                        icon: Icon(Icons.category_sharp),
                        label: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            "Category - $selectedCategory",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
