class Product {
  final int id;
  final String nama;
  final double harga;
  final String imageUrl;
  final String deskripsi;

  // constructor
  Product({
    required this.id,
    required this.nama,
    required this.harga,
    required this.imageUrl,
    required this.deskripsi,
  });

  // method untuk mengkonversi JSON ke objek product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'].toDouble(),
      imageUrl: json['imageUrl'],
      deskripsi: json['deskripsi']
    );
  }

  // method untuk mengkonversi object product ke JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
    };
  }
}