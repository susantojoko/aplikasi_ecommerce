import 'package:aplikasi_ecommerce/transaction/input_alamat.dart';
import 'package:flutter/material.dart';

import '../shared/data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> newCartItems = List<CartItem>.from(sharedCartItems);
  List<bool> selectedItems =
      List.generate(sharedCartItems.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    double subtotal = 0.0;
    for (var item in newCartItems) {
      subtotal += item.quantity * item.price;
    }
    for (int i = 0; i < newCartItems.length; i++) {
      sharedCartItems[i] = newCartItems[i];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
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
      body: newCartItems.isEmpty
          ? const Center(
              child: Text('Keranjang belanja kosong'),
            )
          : ListView.builder(
              itemCount: newCartItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.lime[50],
                      border: Border.all(width: 1, color: Colors.white)),
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding:
                              const EdgeInsets.all(8), // Padding untuk ListTile
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: selectedItems[index],
                                onChanged: (bool? value) {
                                  setState(() {
                                    selectedItems[index] =
                                        value!; // Perbarui status item yang dipilih
                                  });
                                },
                              ),
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(newCartItems[index].imageUrl),
                              ),
                            ],
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(newCartItems[index].jenis),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red,
                                      size: 14,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (newCartItems[index].quantity > 1) {
                                          newCartItems[index].quantity--;
                                        }
                                      });
                                    },
                                  ),
                                  Text(newCartItems[index].quantity.toString(),
                                      style: const TextStyle(fontSize: 14)),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.green,
                                      size: 14,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        newCartItems[index].quantity++;
                                      });
                                    },
                                  ),
                                  Text(
                                      'Rp${newCartItems[index].price.toStringAsFixed(2)}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total :'),
                Text('Rp${subtotal.toStringAsFixed(2)}'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddressForm()));
                // Tambahkan logika untuk melanjutkan ke halaman checkout di sini
              },
              child: const Text('Lanjut ke Checkout'),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteSelectedItems() {
    for (int i = newCartItems.length - 1; i >= 0; i--) {
      if (selectedItems[i]) {
        selectedItems.removeAt(i); // Hapus tanda centang
        newCartItems.removeAt(i); // Hapus item yang dipilih
      }
    }
  }
}
