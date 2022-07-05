import 'package:rxdart/rxdart.dart';
import 'package:rxdartgooglemap/database.dart';


class RXDart {
  BehaviorSubject<List<LocationData>> behaviorSubject;
  Future<void> add(double latitude, double longitude) async {
    print("add");
    await DatabaseHelper.instance
        .add(LocationData(latitude: longitude, longitude: longitude));
    allData();
  }

  delete(int id) async {
    print("delete");
    await DatabaseHelper.instance.delete(id);
    allData();
  }

  Future<void> allData() async {
    behaviorSubject.add(await DatabaseHelper.instance.getData());
  }
  RXDart({required this.behaviorSubject});
}