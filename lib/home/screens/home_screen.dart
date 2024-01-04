import 'dart:convert';
import 'package:aplikasi_ecommerce/home/screens/detail_produk.dart';
import 'package:aplikasi_ecommerce/cart/cart_page.dart';
import 'package:aplikasi_ecommerce/shared/data.dart';
import 'package:http/http.dart' as http;
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String authToken; // Tambahkan parameter authToken

  const HomePage({required this.authToken, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 160;

  List<dynamic> dataBarang = [];
  @override
  void initState() {
    super.initState();
    fetchData();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('http://192.168.2.28:3000/api/products'),
      headers: {
        'Authorization':
            widget.authToken, // Mengirim token otentikasi dalam header
      },
    );
    if (response.statusCode == 200) {
      final responseBody = response.body;
      final responseJson = json.decode(responseBody);

      if (responseJson.containsKey('data')) {
        // Pastikan atribut 'data' ada dalam respons
        final data = responseJson['data'];

        if (data is List) {
          // Pastikan 'data' adalah daftar produk
          setState(() {
            dataBarang = data;
          });
        }
      }
    } else {
      throw Exception('Failed to load dataBarang');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xffBF00FF),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 30),
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText:
                              'Cari produk', // Placeholder dalam TextField
                          prefixIcon: Icon(Icons.search), // Ikona pencarian
                          enabledBorder: InputBorder.none,
                          // Border luar TextField
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartPage()));
                        },
                        child: const Icon(Icons.shopping_cart),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ) // Ikona keranjang
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: 5,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position);
                      }),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: DotsIndicator(
                      dotsCount: 5,
                      position: _currPageValue.round(),
                      decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 90,
                  width: ScreenSize.width >= 600 ? 800 : ScreenSize.width,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Category',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff765827)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const MenuCategory(
                                icon: Icons.star, label: 'Popular'),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.brown.withOpacity(0.5),
                                  )),
                              child: Column(
                                children: [
                                  Image.asset('assets/icons/iconBaju.png'),
                                  const Text('Baju',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             DetailCategory()));
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.brown.withOpacity(0.5),
                                    )),
                                child: Column(
                                  children: [
                                    Image.asset('assets/icons/iconCelana.png'),
                                    const Text('Celana',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            const MenuCategory(
                                icon: Icons.dashboard_customize_rounded,
                                label: 'Other'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Produk Populer'),
                          SizedBox(
                            height:
                                150, // Sesuaikan tinggi sesuai kebutuhan Anda
                            child: ListView(
                              scrollDirection: Axis
                                  .horizontal, // Mengaktifkan pengguliran horizontal
                              children: sharedPakaian.map((product) {
                                return buildProductItem(
                                  product['imageUrl'],
                                  product['jenis'],
                                  product['warna'],
                                  product['rating'],
                                  product['stok'],
                                  product['reviewCount'],
                                  product['price'],
                                  context,
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height:
                                150, // Sesuaikan tinggi sesuai kebutuhan Anda
                            child: ListView(
                              scrollDirection: Axis
                                  .horizontal, // Mengaktifkan pengguliran horizontal
                              children: sharedPakaian.map((product) {
                                return buildProductItem(
                                  product['imageUrl'],
                                  product['jenis'],
                                  product['warna'],
                                  product['rating'],
                                  product['stok'],
                                  product['reviewCount'],
                                  product['price'],
                                  context,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Produk'),
                        SizedBox(
                          height: 500,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Jumlah kolom
                              crossAxisSpacing: 8.0, // Spasi antar kolom
                              mainAxisSpacing: 8.0, // Spasi antar baris
                            ),
                            itemCount: dataBarang.length,
                            itemBuilder: (context, index) {
                              final product = dataBarang[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailPage(
                                        imageUrl: product['image'],
                                        jenis: product['brand'],
                                        stok: product['stok'],
                                        warna: product['name'],
                                        rating: product['stok'].toDouble(),
                                        reviewCount: product['stok'],
                                        price: product['price'].toDouble(),
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(product['name']),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              product['image'],
                                              width: 150,
                                              height: 75,
                                              fit: BoxFit.contain,
                                            ),
                                            Text(
                                              'Brand: ${product['brand']}',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              'Price: Rp ${product['price']}',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 170,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage('assets/images/kemejak.png'),
                    fit: BoxFit.cover),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xffe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ]),
          ),
        ],
      ),
    );
  }
}

class MenuCategory extends StatelessWidget {
  final IconData? icon;
  final String label;

  const MenuCategory({super.key, this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => CategoryPage()));
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.brown,
              width: 0.5,
            )),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.blue,
              size: 32,
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildProductRow(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: sharedPakaian.map(
      (product) {
        return buildProductItem(
          product['imageUrl'],
          product['jenis'],
          product['warna'],
          product['rating'],
          product['stok'],
          product['reviewCount'],
          product['price'],
          context,
        );
      },
    ).toList(),
  );
}

Widget buildProductPopuler(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: sharedPakaian.map(
      (product) {
        return buildProductItem(
          product['imageUrl'],
          product['jenis'],
          product['warna'],
          product['rating'],
          product['stok'],
          product['reviewCount'],
          product['price'],
          context,
        );
      },
    ).toList(),
  );
}

//datanya
Widget buildProductItem(
  String imageUrl,
  String jenis,
  String warna,
  double rating,
  int stok,
  int reviewCount,
  double price,
  BuildContext context, // Tambahkan parameter BuildContext
) {
  return GestureDetector(
    onTap: () {
      // Navigasi ke halaman detail produk saat gambar produk diklik
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => ProductDetailPage(
      //       imageUrl: imageUrl,
      //       jenis: jenis,
      //       stok: stok,
      //       warna: warna,
      //       rating: rating,
      //       reviewCount: reviewCount,
      //       price: price,
      //     ),
      //   ),
      // );
    },
    child: Container(
      height: 150,
      width: 160,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 164, 153, 153),
              blurRadius: 4,
              offset: Offset(0, 4),
            )
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jenis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(5, (index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 12,
                        );
                      }),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '$rating | $reviewCount',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                Text(
                  'Rp $price',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2a977d),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
