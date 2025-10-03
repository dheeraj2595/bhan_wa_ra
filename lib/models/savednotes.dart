import 'package:hive/hive.dart';

part 'savednotes.g.dart';

@HiveType(typeId: 0)
class SavedNotes extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  String category;

  @HiveField(3)
  String categoryIcon;

  SavedNotes({
    required this.title,
    required this.content,
    required this.category,
    required this.categoryIcon,
  });
}
