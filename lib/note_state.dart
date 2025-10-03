import 'package:bhan_wa_ra/models/savednotes.dart';
import 'package:bhan_wa_ra/pages/category_list.dart';
import 'package:flutter/material.dart';
import 'package:bhan_wa_ra/pages/home_page.dart';
import 'package:bhan_wa_ra/pages/categories.dart';
import 'package:bhan_wa_ra/pages/vault.dart';
import 'package:bhan_wa_ra/pages/new_note.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:hive/hive.dart';

class Note {
  String title = "";
  String content = "";
  String category = "";
  String categoryIcon = "";

  Note({
    required this.title,
    required this.content,
    required this.category,
    required this.categoryIcon,
  });
}

extension Notemapper on Note {
  SavedNotes toSavedNotes() {
    return SavedNotes(
      title: title,
      content: content,
      category: this.category,
      categoryIcon: categoryIcon,
    );
  }
}

extension SavedNoteMapper on SavedNotes {
  Note toNote() {
    return Note(
      title: title,
      content: content,
      category: this.category,
      categoryIcon: categoryIcon,
    );
  }
}

class category {
  String categoryName = "";
  String categoryIcon = "";

  category({required this.categoryName, required this.categoryIcon});
}

class NoteState extends ChangeNotifier {
  late Box<SavedNotes> notesBox;
  List<Note> notes = [];
  List<category> categoriesUsed = [];
  Map<String, List<Note>> notesByCategory = {};

  NoteState() {
    notesBox = Hive.box<SavedNotes>('notes');
    loadNotesFromHive();
  }

  void loadNotesFromHive() {
    notes = notesBox.values.map((saved) => saved.toNote()).toList();
    notesByCategory = getNotesByCategory(notes);
    notifyListeners();
  }

  void addNewNote(
    String title,
    String content,
    String category,
    String selectedCategoryIcon,
  ) async {
    final note = Note(
      title: title,
      content: content,
      category: category,
      categoryIcon: selectedCategoryIcon,
    );

    await notesBox.add(note.toSavedNotes());
    loadNotesFromHive();

    notesByCategory = getNotesByCategory(notes);
    notifyListeners();
  }

  void deleteNoteAt(int index) async {
    await notesBox.deleteAt(index);
    loadNotesFromHive();
  }

  void updateNoteAt(int index, Note updatedNote) async {
    await notesBox.putAt(index, updatedNote.toSavedNotes());
    loadNotesFromHive();
  }

  Map<String, List<Note>> getNotesByCategory(List<Note> notes) {
    Map<String, List<Note>> notesByCategory = {};
    for (var Note in notes) {
      if (!notesByCategory.containsKey(Note.category)) {
        notesByCategory[Note.category] = [];
      }
      notesByCategory[Note.category]!.add(Note);
    }
    return notesByCategory;
  }
}

class CategoryState extends ChangeNotifier {
  List<category> coreMasterCategories = [];
  List<category> extendedMasterCategories = [];
  List<category> medicalSuperSpecialityCategories = [];
  List<category> surgicalSuperSpecialityCategories = [];
  List<category> anaesthesiaSuperSpecialityCategories = [];
  List<category> subCategories = [];
  String selectedCategory = "Anaesthesia";
  String selectedCategoryIcon = "💉";

  void loadCoreMasterCategories() {
    coreMasterCategories = [
      category(categoryName: "Anaesthesia", categoryIcon: "💉"),
      category(categoryName: "Internal Medicine", categoryIcon: "🌡️"),
      category(categoryName: "Surgery", categoryIcon: "🔪"),
      category(categoryName: "Pediatrics", categoryIcon: "🧸"),
      category(categoryName: "Obstetrics and gynaecology", categoryIcon: "🤰"),
      category(categoryName: "Orthopedics", categoryIcon: "🦴"),
      category(categoryName: "Psychiatry", categoryIcon: "🧩"),
      category(categoryName: "Radiology", categoryIcon: "🩻"),
      category(categoryName: "Dermatology", categoryIcon: "🧴"),
      category(categoryName: "Otorhinolaryngology", categoryIcon: "👂"),
      category(categoryName: "Ophthalmology", categoryIcon: "👁️"),
      category(categoryName: "Community Medicine", categoryIcon: "🏘️"),
      category(categoryName: "Forensic Medicine", categoryIcon: "💀"),
      category(categoryName: "Pathology", categoryIcon: "🔬"),
      category(categoryName: "Pharmacology", categoryIcon: "💊"),
      category(categoryName: "Microbiology", categoryIcon: "🦠"),
      category(categoryName: "Physiology", categoryIcon: "💓"),
      category(categoryName: "Anatomy", categoryIcon: "🧍"),
      category(categoryName: "Biochemistry", categoryIcon: "🧬"),
    ];
  }

  void loadExtendedMasterCategories() {
    extendedMasterCategories = [
      category(categoryName: "Respiratory Medicine", categoryIcon: "🫁"),
      category(categoryName: "Emergency Medicine", categoryIcon: "🚑"),
      category(categoryName: "Radiation oncology", categoryIcon: "🔆"),
      category(categoryName: "Family Medicine", categoryIcon: "🏡"),
      category(categoryName: "Nuclear Medicine", categoryIcon: "☢️"),
      category(categoryName: "Geriatrics", categoryIcon: "👴"),
      category(categoryName: "Aerospace Medicine", categoryIcon: "🛩️"),
      category(categoryName: "Palliative Medicine", categoryIcon: "🕊️"),
      category(
        categoryName: "Physical Medicine & Rehabilitation",
        categoryIcon: "🤸",
      ),
      category(categoryName: "Hospital Administration", categoryIcon: "🏥"),
      category(categoryName: "Sports Medicine", categoryIcon: "🏃"),
      category(
        categoryName: "Immunohaematology & Blood Transfusion",
        categoryIcon: "🩸",
      ),
      category(categoryName: "Tropical Medicine", categoryIcon: "🌴"),
    ];
  }

  void loadSurgicalSuperspecialityCategories() {
    surgicalSuperSpecialityCategories = [
      category(categoryName: "Plastic Surgery", categoryIcon: "🧑‍⚕️"),
      category(categoryName: "Neuro Surgery", categoryIcon: "🧠"),
      category(categoryName: "Onco Surgery", categoryIcon: "🎗️"),
      category(categoryName: "Urology", categoryIcon: "🚻"),
      category(
        categoryName: "Cardiothoracic & Vascular Surgery",
        categoryIcon: "❤️",
      ),
      category(categoryName: "Pediatric Surgery", categoryIcon: "👶"),
      category(categoryName: "Hand Surgery", categoryIcon: "✋"),
      category(categoryName: "Trauma Surgery", categoryIcon: "🚑"),
      category(categoryName: "Gastrointestinal Surgery", categoryIcon: "🍽️"),
      category(categoryName: "Head & Neck Surgery", categoryIcon: "👤"),
      category(
        categoryName: "Breast and Endocrine surgery",
        categoryIcon: "🎀",
      ),
      category(
        categoryName: "Reproductive medicine and surgery",
        categoryIcon: "🥚",
      ),
      category(
        categoryName: "Orthopedic Pediatric Surgery",
        categoryIcon: "🧒",
      ),
    ];
  }

  void loadMedicalSuperspecialityCategories() {
    medicalSuperSpecialityCategories = [
      category(categoryName: "Gastroenterology", categoryIcon: "🌮"),
      category(categoryName: "Endocrinology", categoryIcon: "🦋"),
      category(categoryName: "Rheumatology", categoryIcon: "🦵"),
      category(categoryName: "Nephrology", categoryIcon: "🫘"),
      category(categoryName: "Cardiology", categoryIcon: "❤️"),
      category(categoryName: "Neurology", categoryIcon: "🧠"),
      category(categoryName: "Hepatology", categoryIcon: "🍺"),
      category(categoryName: "Medical Oncology", categoryIcon: "🎗️"),
      category(categoryName: "Medical Genetics", categoryIcon: "🧬"),
    ];
  }

  void loadAnaesthesiaSuperspecialityCategories() {
    anaesthesiaSuperSpecialityCategories = [
      category(categoryName: "Pain Medicine", categoryIcon: "💊"),
      category(categoryName: "Critical care medicine", categoryIcon: "🏥"),
      category(categoryName: "Neuro anaesthesia", categoryIcon: "🧠"),
      category(categoryName: "Cardiac Anaesthesia", categoryIcon: "❤️"),
      category(categoryName: "Regional anaesthesia", categoryIcon: "📍"),
    ];
  }

  void loadLists() {
    loadCoreMasterCategories();
    loadExtendedMasterCategories();
    loadSurgicalSuperspecialityCategories();
    loadMedicalSuperspecialityCategories();
    loadAnaesthesiaSuperspecialityCategories();
  }

  void thisCategory(String categoryName, String categoryIcon) {
    selectedCategory = categoryName;
    selectedCategoryIcon = categoryIcon;
    notifyListeners();
  }

  notifyListeners();
}

class PageChangeState extends ChangeNotifier {
  int selectedIndex = 0;
  bool selectionOfCategory = false;
  var titleController = TextEditingController();
  var contentController = QuillController.basic();
  Note temp = Note(title: "", content: "", category: "", categoryIcon: "");

  final List<WidgetBuilder> pages = [
    (context) => MyHomePage(title: 'home'),
    (context) => CategoryPage(title: 'category'),
    (context) => NewNote(title: 'New note'),
    (context) => VaultPage(title: 'vault'),
    (context) => CategoryListPage(title: 'All categories'),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    if (index == 2) {
      titleController.clear();
      contentController = QuillController.basic();
    }
    notifyListeners();
  }

  void selectCategory() {
    selectionOfCategory = true;
    selectedIndex = 4;
    notifyListeners();
  }

  void tempNote(String title, String content) {
    temp.title = title;
    temp.content = content;
    notifyListeners();
  }

  void newNotePage() {
    selectedIndex = 2;

    notifyListeners();
  }
}
