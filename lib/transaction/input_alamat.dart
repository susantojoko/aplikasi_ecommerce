import 'package:aplikasi_ecommerce/transaction/paymen.dart';
import 'package:flutter/material.dart';
import '../shared/data.dart';

class AddressForm extends StatefulWidget {
  //cart
  final List<CartItem> newCartItems = List<CartItem>.from(sharedCartItems);

  AddressForm({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();

  bool addressIsHome = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alamat Pengiriman'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('Kontak'),
              const SizedBox(height: 10),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                ),
              ),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'No. Telepon',
                ),
              ),
              const SizedBox(height: 10),
              const Text('Alamat'),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                  hintText: 'Desa, Kecamatan, Kota, Provinsi',
                ),
              ),
              TextField(
                controller: _zipCodeController,
                decoration: const InputDecoration(
                  labelText: 'Kode Pos',
                ),
              ),
              TextField(
                controller: _streetController,
                decoration: const InputDecoration(
                  labelText: 'Nama Jalan',
                ),
              ),
              const SizedBox(height: 10),
              CheckboxListTile(
                title: const Text('Atur sebagai alamat rumah'),
                value: addressIsHome,
                onChanged: (bool? newValue) {
                  setState(() {
                    addressIsHome = newValue ?? false;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Mengambil alamat dari controller
                  String name = _nameController.text;
                  String phone = _phoneController.text;
                  String address = _addressController.text;
                  String zipCode = _zipCodeController.text;
                  String street = _streetController.text;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentPage(
                          imageUrl: '',
                          quantity: 1,
                          jenis: '',
                          price: 1,
                          selectedSize: '',
                        ),
                      ));

                  print('Nama: $name');
                  print('No. Telepon: $phone');
                  print('Alamat: $address');
                  print('Kode Pos: $zipCode');
                  print('Nama Jalan: $street');
                  print('Alamat rumah: $addressIsHome');
                },
                child: const Text('Simpan Alamat'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _zipCodeController.dispose();
    _streetController.dispose();
    super.dispose();
  }
}
