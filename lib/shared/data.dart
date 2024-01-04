import 'package:shared_preferences/shared_preferences.dart';

List<Map<String, dynamic>> sharedProducts = [
  {
    'imageUrl': 'assets/images/kemejak.png',
    'productName': 'SmartPhone1',
    'rating': 4.5,
    'reviewCount': 3987,
    'price': 1.500000,
  },
  {
    'imageUrl': 'assets/images/hp2.jpg',
    'productName': 'SmartPhone2',
    'rating': 4.0,
    'reviewCount': 2750,
    'price': 1.200000,
  },
  {
    'imageUrl': 'assets/images/hp3.jpg',
    'productName': 'SmartPhone3',
    'rating': 4.0,
    'reviewCount': 2750,
    'price': 1.900000,
  },
  // Tambahkan produk lainnya di sini
];

List<Map<String, dynamic>> sharedPakaian = [
  {
    'imageUrl': 'assets/images/kemejak.png',
    'jenis': 'jeans',
    'stok': 33,
    'warna': 'merah',
    'rating': 4.0,
    'reviewCount': 2750,
    'price': 170000.00,
  },
  {
    'imageUrl': 'assets/images/kemejak.png',
    'jenis': 'kemeja',
    'stok': 33,
    'warna': 'merah',
    'rating': 4.0,
    'reviewCount': 2750,
    'price': 100000.00,
  },
  {
    'imageUrl': 'assets/images/kemejak.png',
    'jenis': 'kemeja',
    'stok': 33,
    'warna': 'merah',
    'rating': 4.0,
    'reviewCount': 2750,
    'price': 50000.00,
  },
  {
    'imageUrl': 'assets/images/kemejak.png',
    'jenis': 'kaos',
    'stok': 33,
    'warna': 'merah',
    'rating': 4.0,
    'reviewCount': 2750,
    'price': 20000.00,
  },
];

//data
class CartItem {
  String imageUrl;
  String jenis;
  int quantity;
  double price;

  CartItem(
    this.imageUrl,
    this.jenis,
    this.quantity,
    this.price,
  );
}

List<CartItem> sharedCartItems = [];

class BeliItem {
  String imageUrl;
  String jenis;
  int quantity;
  double price;
  String selectedSize;

  BeliItem(
    this.imageUrl,
    this.jenis,
    this.quantity,
    this.price,
    this.selectedSize,
  );
}

List<BeliItem> sharedBeliItems = [];

class FavoriteItem {
  String imageUrl;
  String jenis;
  double rating;
  double price;
  int reviewCount;
  FavoriteItem(
      this.imageUrl, this.jenis, this.rating, this.price, this.reviewCount);
}

List<FavoriteItem> sharedFavoriteItems = [];

class TokenManager {
  static const String _tokenKey = 'token';

  // Singleton instance
  static final TokenManager _instance = TokenManager._internal();

  factory TokenManager() {
    return _instance;
  }

  TokenManager._internal();

  Future<void> saveTokenLocally(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getTokenLocally() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }
}
