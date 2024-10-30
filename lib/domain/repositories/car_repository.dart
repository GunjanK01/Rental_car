import 'package:rental_car_app/data/models/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}