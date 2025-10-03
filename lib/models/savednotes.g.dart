// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savednotes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedNotesAdapter extends TypeAdapter<SavedNotes> {
  @override
  final int typeId = 0;

  @override
  SavedNotes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedNotes(
      title: fields[0] as String,
      content: fields[1] as String,
      category: fields[2] as String,
      categoryIcon: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavedNotes obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.categoryIcon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedNotesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
