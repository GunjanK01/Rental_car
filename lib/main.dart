import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_car_app/firebase_options.dart';
import 'package:rental_car_app/injection_contaner.dart';
import 'package:rental_car_app/presentation/bloc/car_bloc.dart';
import 'package:rental_car_app/presentation/bloc/car_event.dart';
import 'presentation/pages/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
    );
    initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CarBloc>()..add(LoadCars()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
         
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 58, 15, 132)),
          useMaterial3: true,
        ),
        home: const OnboardingPage(),
      ),
    );
  }
}
