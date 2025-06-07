// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modul7/Pagesnavigation/detail.dart';
import 'package:modul7/models/product.dart';

class Mypage extends StatelessWidget {
  Mypage({super.key});

  final List<Product> products = [
    Product(
      id: 1,
      nama: 'Moisturizer La Roche-Posay ',
      harga: 200000,
      imageUrl:
          'https://tse3.mm.bing.net/th?id=OIP.yukfZsL8W4uUV-XOfLJZ2AHaHa&pid=Api',
      deskripsi: 'Menjaga kelembapan kulit sepanjang hari.',
    ),
    Product(
      id: 2,
      nama: 'Sunscreen La Roche-Posay',
      harga: 500000,
      imageUrl:
          'https://tse2.mm.bing.net/th?id=OIP.s-0ofNbSi6YihqAOSpjOFAHaHa&pid=Api',
      deskripsi: 'Melindungi kulit dari sinar UV dengan SPF 50+.',
    ),
    Product(
      id: 3,
      nama: 'Serum Vitamin C La Roche-Posay',
      harga: 1800000,
      imageUrl:
          'https://tse4.mm.bing.net/th?id=OIP.CgqxgopGsGSA6BP5HaN1JwHaJF&pid=Api',
      deskripsi: 'Mencerahkan dan meratakan warna kulit.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produk Skincare'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 192, 131, 253),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(product.imageUrl, width: 70, height: 70),
            title: Text(product.nama),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Harga : Rp${product.harga}'),
                Text(product.deskripsi),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailProduct(data: 'Ini data dari My page'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
