import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bhan_wa_ra/note_state.dart';

class CategoryListPage extends StatelessWidget {
  final String title;
  const CategoryListPage({super.key, required this.title});

  Widget _buildExpandableSection(
    BuildContext context,
    String title,
    List<category> items,
  ) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.05,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: items.map((cat) {
        return ListTile(
          leading: Text(
            cat.categoryIcon,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.07,
            ),
          ),
          title: Text(
            cat.categoryName,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
            ),
          ),
          onTap: () {
            // handle tap here
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryState = context.read<CategoryState>();

    // populate lists
    categoryState.loadLists();

    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: ListView(
        children: [
          _buildExpandableSection(
            context,
            "Core Specialities",
            categoryState.coreMasterCategories,
          ),
          _buildExpandableSection(
            context,
            "Extended Specialities",
            categoryState.extendedMasterCategories,
          ),
          _buildExpandableSection(
            context,
            "Surgical Superspecialities",
            categoryState.surgicalSuperSpecialityCategories,
          ),
          _buildExpandableSection(
            context,
            "Medical Superspecialities",
            categoryState.medicalSuperSpecialityCategories,
          ),
          _buildExpandableSection(
            context,
            "Anaesthesia Superspecialities",
            categoryState.anaesthesiaSuperSpecialityCategories,
          ),
        ],
      ),
    );
  }
}
