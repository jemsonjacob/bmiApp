import 'package:bmi/model/bodymodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BmiRepository {
  BmiRepository(this.box);

  final Box<Body> box;

  Future<void> saveBody(Body body) async {
    await box.add(body);
  }

  Future<List<Body>> getHistory() async {
    return box.values.toList();
  }
}
