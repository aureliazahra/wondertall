import 'package:wondertall/data/models/destination.dart';
import 'package:wondertall/core/constanst.dart';

final destination = <Destination>[
  Destination(
    id: 'disney',
    name: 'DisneyLand Japan',
    city: 'Tokyo',
    country: 'Japan',
    imageUrl: Assets.disney,
    rating: 4.7,
    reviews: 4700,
    priceLabel: '\$59/Person',
    tags: ['Japan', 'DisneyLand'],
    gallery: [Assets.gallery1, Assets.gallery2, Assets.gallery3],
  ),
  Destination(
    id: 'eifel',
    name: 'Eifel Tower',
    city: 'Paris',
    country: 'France',
    imageUrl: Assets.eiffel,
    rating: 4.9,
    reviews: 1239,
    priceLabel: '\$69/Person',
    tags: ['French', 'City Tour'],
    gallery: [Assets.gallery3, Assets.gallery2, Assets.gallery1],
  ),
  Destination(
    id: 'burg_eltz',
    name: 'Burg Eltz',
    city: 'Wierschem',
    country: 'Germany',
    imageUrl: Assets.burg,
    rating: 4.7,
    reviews: 8900,
    priceLabel: '\$89/Person',
    tags: ['Castle', 'Historic'],
    gallery: [Assets.gallery4, Assets.gallery1, Assets.gallery2],
  ),
];
