class Destination {
  final String id;
  final String name;
  final String city;
  final String country;
  final String imageUrl;
  final double rating;
  final int reviews;
  final String priceLabel;
  final List<String> tags;
  final List<String> gallery;

  const Destination({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    required this.priceLabel,
    required this.tags,
    required this.gallery,
  });

  String get location => '$city, $country'; 
}
