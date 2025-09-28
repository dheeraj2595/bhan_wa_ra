import 'package:bhan_wa_ra/pages/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:bhan_wa_ra/main.dart';
import 'package:bhan_wa_ra/pages/home_page.dart';
import 'package:bhan_wa_ra/pages/categories.dart';
import 'package:bhan_wa_ra/pages/vault.dart';
import 'package:bhan_wa_ra/pages/new_note.dart';

class Note {
  String title = "";
  String content = "";
  String category = "";

  Note({required this.title, required this.content, required this.category});
}

class category {
  String categoryName = "";
  String categoryIcon = "";

  category({required this.categoryName, required this.categoryIcon});
}

class NoteState extends ChangeNotifier {
  List<Note> notes = [];

  void addNewNote(String title, String content, String category) {
    notes.add(Note(title: title, content: content, category: category));
    notifyListeners();
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

  notifyListeners();

  void selectCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryListPage(title: 'Select category'),
      ),
    );
  }
}

class pageChangeState extends ChangeNotifier {
  int selectedIndex = 0;

  final List<WidgetBuilder> pages = [
    (context) => MyHomePage(title: 'home'),
    (context) => CategoryPage(title: 'category'),
    (context) => NewNote(title: 'New note'),
    (context) => VaultPage(title: 'vault'),
    (context) => CategoryListPage(title: 'All categories'),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void selectCategory() {
    selectedIndex = 4;
    notifyListeners();
  }
}
