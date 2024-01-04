import 'package:aplikasi_ecommerce/shared/data.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  final String authToken;
  const FavoritePage({required this.authToken, Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final List<FavoriteItem> newFavoriteItems =
      List<FavoriteItem>.from(sharedFavoriteItems);
  List<bool> selectedItems =
      List.generate(sharedFavoriteItems.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        actions: [
          IconButton(
            onPressed: () {
              _deleteSelectedItems(); // Panggil fungsi untuk menghapus item yang dipilih
            },
            icon:
                const Icon(Icons.delete), // Icon untuk menghapus item terpilih
          )
        ],
      ),
      body: newFavoriteItems.isEmpty
          ? const Center(
              child: Text('Favorite kosong'),
            )
          : ListView.builder(
              itemCount: newFavoriteItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          width: 100,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  newFavoriteItems[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                newFavoriteItems[index].jenis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Text(
                              //   warna,
                              //   style: TextStyle(
                              //     fontSize: 12,
                              //     color: Colors.black,
                              //   ),
                              // ),
                              // SizedBox(height: 2),
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
                                  // Icon(
                                  //   Icons.star,
                                  //   size: 12,
                                  //   color: Colors.orange,
                                  // ),
                                  const SizedBox(width: 3),
                                  Text(
                                    '${newFavoriteItems[index].rating} | ${newFavoriteItems[index].reviewCount}',
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ],
                              ),
                              Text(
                                'Rp ${newFavoriteItems[index].price}',
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
                  const Positioned(
                      top: 20,
                      left: 300,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 20,
                      )),
                  const Positioned(
                      top: 60,
                      left: 300,
                      child: Icon(
                        Icons.delete,
                        color: Colors.green,
                        size: 20,
                      )),
                ]);
              },
            ),
    );
  }

  // Fungsi untuk menghapus item yang dipilih
  void _deleteSelectedItems() {
    for (int i = selectedItems.length - 1; i >= 0; i--) {
      if (selectedItems[i]) {
        selectedItems.removeAt(i);
        newFavoriteItems.removeAt(i);
      }
    }
  }
}
