class TravelPackage {
  String destination;
  int basePrice;
  String travelClass = 'Economy'; // Default travel class
  bool insurance = false; // Default: no insurance
  bool guidedTour = false; // Default: no guided tour

  TravelPackage(this.destination, this.basePrice);

  // Display travel package details in the dropdown menu
  @override
  String toString() {
    return '$destination (\$$basePrice)';
  }

  // Calculate total price based on selections
  String getTotalPrice() {
    int insuranceCost = insurance ? 500 : 0;
    int tourCost = guidedTour ? 700 : 0;
    double classMultiplier = (travelClass == 'Business')
        ? 1.5
        : (travelClass == 'First Class')
            ? 2.0
            : 1.0;

    return (basePrice * classMultiplier + insuranceCost + tourCost).toStringAsFixed(0);
  }
}

// Sample list of travel packages
List<TravelPackage> packages = [
  TravelPackage('Paris', 3000),
  TravelPackage('New York', 2500),
  TravelPackage('Tokyo', 4000),
  TravelPackage('Sydney', 3500),
];
