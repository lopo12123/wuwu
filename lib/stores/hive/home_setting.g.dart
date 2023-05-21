// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_setting.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeSettingAdapter extends TypeAdapter<HomeSetting> {
  @override
  final int typeId = 0;

  @override
  HomeSetting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeSetting(
      type: fields[0] as int,
      count: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HomeSetting obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeSettingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
