import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:rental_car_app/data/datasources/firebase_car_data_source.dart';
import 'package:rental_car_app/data/repositories/car_repository_impl.dart';
import 'package:rental_car_app/domain/repositories/car_repository.dart';
import 'package:rental_car_app/domain/usecases/get_cars.dart';
import 'package:rental_car_app/presentation/bloc/car_bloc.dart';

GetIt getIt = GetIt.instance;

// Function to initialize dependency injection using GetIt
void initInjection(){
  try{
    // Register FirebaseFirestore as a singleton to use across the app
    getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(
      ()=>FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()));

       getIt.registerLazySingleton<CarRepository>(
      ()=>CarRepositoryImpl(getIt<FirebaseCarDataSource>()));

      getIt.registerLazySingleton<GetCars>(
      ()=>GetCars(getIt<CarRepository>()));

      getIt.registerFactory(()=> CarBloc(getCars: getIt<GetCars>()));

  
  }
  catch(e){
    // Rethrow the error if any exception occurs during registration
    rethrow;
  }
}