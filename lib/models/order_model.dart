class OrderModel {
  final String id;
  final String productName;
  final String description;
  final double price;
  final int quantity;
  final String supplier;
  final String? imageUrl;
  final String createdAt;
  final String status;

  OrderModel({
    required this.id,
    required this.productName,
    required this.description,
    required this.price,
    required this.quantity,
    required this.supplier,
    this.imageUrl,
    required this.createdAt, required this.status, required String productname, required String createdat,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] ?? '',
      productName: map['product_name'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      quantity: map['quantity'] ?? 0,
      supplier: map['supplier'] ?? '',
      imageUrl: map['image_url'],
      createdAt: map['created_at'] ?? '', status: '', productname: '', createdat: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product_name': productName,
      'description': description,
      'price': price,
      'quantity': quantity,
      'supplier': supplier,
      'image_url': imageUrl,
    };
  }
}