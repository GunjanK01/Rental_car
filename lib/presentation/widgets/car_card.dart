import 'package:flutter/material.dart';
import 'package:rental_car_app/data/models/car.dart';
import 'package:rental_car_app/presentation/pages/car_details_pge.dart';

class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({required this.car, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CarDetailsPge(car: car,)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            )
          ]
        ),
        child: Column(
          children: [
            Image.asset('assets/car_image.png',height: 120,),
            Text(car.model, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/gps.png'),
                        Text('${car.distance.toStringAsFixed(0)}km')
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('assets/pump.png'),
                        Text('${car.fuelCapacity.toStringAsFixed(0)}L')
                      ],
                    )
                  ],
                ),
                Text('\$${car.pricePerHour.toStringAsFixed(2)}/hr', style: const TextStyle(fontSize: 16),)
              ],
            )
          ],
        ),
      ),
    );
  }
}