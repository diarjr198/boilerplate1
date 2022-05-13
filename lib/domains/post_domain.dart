class Home {
  final int id,
      price,
      rating,
      numberOfKitchens,
      numberOfBedrooms,
      numberOfCupboards;
  final String name, city, country, imageUrl, address, phone, mapUrl;

  Home({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.imageUrl,
    required this.address,
    required this.phone,
    required this.mapUrl,
    required this.price,
    required this.rating,
    required this.numberOfKitchens,
    required this.numberOfBedrooms,
    required this.numberOfCupboards,
  });
}
