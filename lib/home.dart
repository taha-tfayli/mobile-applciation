import 'package:flutter/material.dart';
import 'travel_package.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TravelPackage selectedPackage = packages.first;
  String totalPrice = packages.first.getTotalPrice();

  void updatePackage(TravelPackage package) {
    setState(() {
      selectedPackage = package;
      totalPrice = package.getTotalPrice();
    });
  }

  void updateTravelClass(String travelClass) {
    setState(() {
      selectedPackage.travelClass = travelClass;
      totalPrice = selectedPackage.getTotalPrice();
    });
  }

  void updateExtraService(String service, bool value) {
    setState(() {
      if (service == 'Insurance') selectedPackage.insurance = value;
      if (service == 'Guided Tour') selectedPackage.guidedTour = value;
      totalPrice = selectedPackage.getTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel Package Selector')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Select Destination', style: TextStyle(fontSize: 18)),
            DropdownButton<TravelPackage>(
              value: selectedPackage,
              items: packages.map((package) {
                return DropdownMenuItem<TravelPackage>(
                  value: package,
                  child: Text(package.toString()),
                );
              }).toList(),
              onChanged: (package) => updatePackage(package!),
            ),
            const SizedBox(height: 20),
            const Text('Select Travel Class', style: TextStyle(fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'Economy',
                  groupValue: selectedPackage.travelClass,
                  onChanged: (value) => updateTravelClass(value as String),
                ),
                const Text('Economy'),
                Radio(
                  value: 'Business',
                  groupValue: selectedPackage.travelClass,
                  onChanged: (value) => updateTravelClass(value as String),
                ),
                const Text('Business'),
                Radio(
                  value: 'First Class',
                  groupValue: selectedPackage.travelClass,
                  onChanged: (value) => updateTravelClass(value as String),
                ),
                const Text('First Class'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Travel Insurance', style: TextStyle(fontSize: 18)),
                Checkbox(
                  value: selectedPackage.insurance,
                  onChanged: (value) =>
                      updateExtraService('Insurance', value!),
                ),
                const SizedBox(width: 20),
                const Text('Guided Tour', style: TextStyle(fontSize: 18)),
                Checkbox(
                  value: selectedPackage.guidedTour,
                  onChanged: (value) =>
                      updateExtraService('Guided Tour', value!),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Total Price: \$$totalPrice',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
