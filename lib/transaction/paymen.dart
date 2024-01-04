import 'package:flutter/material.dart';
import '../shared/data.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class PaymentPage extends StatefulWidget {
  final String imageUrl;
  final String jenis;
  final int quantity;
  final double price;
  final String selectedSize;
  final bool isFromDirectBuy;

  const PaymentPage(
      {super.key, required this.imageUrl,
      required this.jenis,
      required this.quantity,
      required this.price,
      required this.selectedSize,
      this.isFromDirectBuy = true});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final List<BeliItem> newBeliItems = List<BeliItem>.from(sharedBeliItems);
  String selectedPaymentMethod = ' '; // Metode pembayaran default
  String selectedPaymentMethodWallet = ' '; // Metode pembayaran default

  final List<CartItem> newCartItems = List<CartItem>.from(sharedCartItems);

  @override
  Widget build(BuildContext context) {
    double subtotal = 0.0;

    for (var item in newBeliItems) {
      subtotal += item.quantity * item.price;
    }
    double subtotal2 = 0.0;

    for (var item in newCartItems) {
      subtotal += item.quantity * item.price;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Alamat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                width: MediaQuery.of(context).size.width - 30,
                child: const Column(
                  children: [
                    Text(
                      'Alamat: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: const Center(
                  child: Text(
                    'ubah',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text('Produk'),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                  ),
                ),
              ),
              child: ListView.builder(
                itemCount: widget.isFromDirectBuy
                    ? newCartItems.length
                    : newBeliItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.lime[50],
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                    ),
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            widget.isFromDirectBuy
                                ? newCartItems[index].imageUrl
                                : widget.imageUrl,
                            fit: BoxFit.contain,
                            width: 100,
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8.0,
                              right: 50,
                              left: 8,
                              top: 8,
                            ),
                            child: Column(
                              children: [
                                Text(widget.isFromDirectBuy
                                    ? newCartItems[index].jenis
                                    : widget.jenis),
                                const SizedBox(height: 10),
                                Text(
                                    'jumlah ${widget.isFromDirectBuy ? newCartItems[index].quantity.toString() : widget.quantity.toString()}'),
                              ],
                            ),
                          ),
                          Text(widget.isFromDirectBuy
                              ? newCartItems[index].price.toString()
                              : widget.price.toString()),
                          Text(subtotal2.toString())
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total :'),
                Text('Rp ${subtotal.toStringAsFixed(2)}'),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  const Icon(Icons.account_balance_wallet),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('Credit Cart'),
                  const SizedBox(
                    width: 5,
                  ),
                  DropdownButton(
                    value: selectedPaymentMethod,
                    onChanged: (newValue) {
                      setState(() {
                        selectedPaymentMethod = newValue.toString();
                      });
                    },
                    items: <String>[
                      ' ',
                      'Visa',
                      'MasterCard',
                      'American Express',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  const Icon(Icons.credit_card),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('E-Wallet'),
                  const SizedBox(
                    width: 5,
                  ),
                  DropdownButton(
                    value: selectedPaymentMethodWallet,
                    onChanged: (newValue) {
                      setState(() {
                        selectedPaymentMethodWallet = newValue.toString();
                      });
                    },
                    items: <String>[
                      ' ',
                      'Dana',
                      'OVO',
                      'Gopay',
                      'Shopeepay',
                      'LinkAja'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Payment',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp ${subtotal.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff2a977d),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType
                      // ignore: deprecated_member_use
                      .SUCCES, // Jenis alert yang akan ditampilkan (SUCCES untuk pesan sukses)
                  // ignore: deprecated_member_use
                  animType: AnimType.BOTTOMSLIDE, // Animasi masuknya alert
                  title: 'Berhasil Dibeli',
                  desc: 'Produk telah berhasil dibeli.',
                  btnOkOnPress: () {
                    Navigator.of(context)
                        .pop(); // Tutup alert saat tombol OK ditekan
                  },
                ).show();
              },
              child: const Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
