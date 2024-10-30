import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rental_car_app/data/models/car.dart';

class MapsDetailsPage extends StatelessWidget {
  final Car car;

  const MapsDetailsPage({super.key, required this.car});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);}, 
          icon: const Icon(Icons.arrow_back_ios),
          ),
      ),

       body: Stack(
         children: [
           FlutterMap(
            options: const MapOptions(
                initialCenter: LatLng(23.02, 72.57),
                initialZoom: 11,
                interactionOptions: InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),
           ),
            children: [openStreetMapTileLayer],),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: carDetailsCard(car: car))
         ],
       ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
  urlTemplate:'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'com.example.rental_car_app',
  //subdomains: ['a', 'b', 'c'],
 
);

              
Widget carDetailsCard({required Car car}) {
  return SizedBox(
    height: 350,
    child: Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0,blurRadius: 10)
              ],),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Text(car.model, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Icon(Icons.directions_car, color: Colors.white,size: 16,),
                      const SizedBox(width: 5,),
                      Text('> ${car.distance} km', style: const TextStyle(color: Colors.white, fontSize: 14),),
                      const SizedBox(width: 10,),

                      const Icon(Icons.battery_full, color: Colors.white,size: 16,),

                      Text(car.fuelCapacity.toString(),
                       style: const TextStyle(fontSize: 14, color: Colors.white),),

                    ],
                  )
                ],
              ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const Text("Features",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              featureIcons(),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$ ${car.pricePerHour}/day', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  ElevatedButton(onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text('Book Now', style: TextStyle(color: Colors.white)),)
                ],
              )
              ],
            ),
          ),
          ),
          Positioned(
            top: 50,
            right: 15,
            child: Image.asset('assets/white_car.png')),
      ],
    ),
  );
}

Widget featureIcons(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(Icons.local_gas_station, 'Diesel', 'Common Rail'),
      featureIcon(Icons.speed, 'Acceleration', '0-100km/hr'),
      featureIcon(Icons.ac_unit, 'Cold','Temp Control'),
    ],
  );
}

Widget featureIcon(IconData icon, String title, String subtitle){
  return Container(
    width: 100,
    height: 100,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey, width: 1)
    ),
    child: Column(
      children: [
        Icon(icon, size: 28,),
        Text(title),
        Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 10),),
      ],
    ),
  );
}