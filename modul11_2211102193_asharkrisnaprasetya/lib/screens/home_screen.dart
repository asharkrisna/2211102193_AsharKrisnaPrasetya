import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/item.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Item> availableItems = [
    Item(id: 1, name: "Beras", price: 15000000),
    Item(id: 2, name: "Gula", price: 250000),
    Item(id: 3, name: "Tepung", price: 500000),
    Item(id: 4, name: "Bumbu dapur", price: 1500000),
    Item(id: 5, name: "Minyak", price: 1500000),
    // ✅ Tambahan item baru
    Item(id: 6, name: "Susu", price: 120000),
  ];

  // ✅ Fungsi untuk format harga jadi Rupiah
  String formatRupiah(int amount) {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("F Mart"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: availableItems.length,
        itemBuilder: (context, index) {
          final item = availableItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(formatRupiah(item.price)), // ✅ Harga format rupiah
            trailing: ElevatedButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).add(item);
                // ✅ Tampilkan snackbar konfirmasi
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} berhasil ditambahkan ke keranjang.'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text("Tambah"),
            ),
          );
        },
      ),
    );
  }
}
