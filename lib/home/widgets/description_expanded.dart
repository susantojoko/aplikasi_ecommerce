import 'package:flutter/material.dart';

// ignore: camel_case_types
class descriptionsExpanded extends StatefulWidget {
  const descriptionsExpanded({super.key});

  @override
  State<descriptionsExpanded> createState() => _descriptionsExpandedState();
}

// ignore: camel_case_types
class _descriptionsExpandedState extends State<descriptionsExpanded> {
  bool _isExpanded = false; // boolean memperluas
  String firstText =
      'Ini adalah deskripsi lengkap produk. Produk ini memiliki berbagai fitur, spesifikasi, dan informasi detail yang akan membantu Anda memahami lebih lanjut tentang produk ini ';
  String secondText =
      ' Ini adalah deskripsi lengkap produk. Produk ini memiliki berbagai fitur, spesifikasi, dan informasi detail yang akan membantu Anda memahami lebih lanjut tentang produk ini.';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Spesifikasi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          _isExpanded
              ? Column(
                  children: [
                    const Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(firstText + secondText),
                  ],
                )
              : Column(
                  children: [
                    const Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text('$firstText...'),
                  ],
                ),
          ListTile(
            title: Center(
              child: _isExpanded
                  ? const Wrap(
                      spacing: 8.0, // Jarak antara ikon dan teks
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          'Perkecil',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_up),
                      ],
                    )
                  : const Wrap(
                      spacing: 8.0, // Jarak antara ikon dan teks
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          'Selengkapnya',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          )
        ],
      ),
    );
  }
}
