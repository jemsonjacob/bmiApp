import 'package:bmi/model/bmimodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BmiRepository {
  BmiRepository(this.box);

  final Box<Bmi> box;

  Future<void> saveBody(Bmi body) async {
    await box.add(body);
  }

  Future<List<Bmi>> getHistory() async {
    return box.values.toList();
  }

  Future<void> deleteBody(int index) async {
    await box.deleteAt(index);
  }
}
