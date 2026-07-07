// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bodymodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BodyAdapter extends TypeAdapter<Body> {
  @override
  final int typeId = 0;

  @override
  Body read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Body(
      height: fields[0] as double,
      weight: fields[1] as double,
      date: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Body obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.height)
      ..writeByte(1)
      ..write(obj.weight)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BodyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
