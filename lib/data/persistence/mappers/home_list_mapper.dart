import 'package:boilerplate/domains/post_domain.dart';

class HomeListMapper {
  // List<Home> homeList(List<Home> response) {
  //   List<Home> data = response.map((e) => _mapperHome(e)).toList();

  //   return data;
  // }

  // Home _mapperHome(dynamic data) {
  //   var home = Home(
  //     id: data['id'] ?? 0,
  //     name: data['name'] ?? '',
  //     city: data['city'] ?? '',
  //     country: data['country'] ?? '',
  //     price: data['price'] ?? 0,
  //     imageUrl: data['image_url'] ?? '',
  //     rating: data['rating'] ?? 0,
  //     address: data['address'] ?? '',
  //     phone: data['phone'] ?? '',
  //     mapUrl: data['map_url'] ?? '',
  //     numberOfKitchens: data['number_of_kitchens'] ?? 0,
  //     numberOfBedrooms: data['number_of_bedrooms'] ?? 0,
  //     numberOfCupboards: data['number_of_cupboards'] ?? 0,
  //   );

  //   return home;
  // }

  // Map<String, dynamic> toJson(Home home) {
  //   return {
  //     'data': <String, dynamic>{
  //       'id': home.id,
  //       'name': home.name,
  //       'city': home.city,
  //       'country': home.country,
  //       'price': home.price,
  //       'imageUrl': home.imageUrl,
  //       'rating': home.rating,
  //       'address': home.address,
  //       'phone': home.phone,
  //       'mapUrl': home.mapUrl,
  //       'numberOfKitchens': home.numberOfKitchens,
  //       'numberOfBedrooms': home.numberOfBedrooms,
  //       'numberOfCupboards': home.numberOfCupboards,
  //     }
  //   };
  // }

  Home fromJson(Map<String, dynamic> data) {
    return Home(
      id: data['id'],
      name: data['name'],
      city: data['city'],
      country: data['country'],
      price: data['price'],
      imageUrl: data['imageUrl'],
      rating: data['rating'],
      address: data['address'],
      phone: data['phone'],
      mapUrl: data['mapUrl'],
      numberOfKitchens: data['numberOfKitchens'],
      numberOfBedrooms: data['numberOfBedrooms'],
      numberOfCupboards: data['numberOfCupboards'],
    );
  }
}
