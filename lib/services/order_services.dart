import 'package:stock_pilot/models/order_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrderService {
  final supabase = Supabase.instance.client;

  // add order to supabase
  Future<void> addOrder(OrderModel order) async {
    await supabase.from('orders').insert(order.toMap());
  }

  // fetch all orders
  Future<List<OrderModel>> getOrders() async {
    final response = await supabase
        .from('orders')
        .select()
        .order('created_at', ascending: false);

    return response
        .map((item) => OrderModel.fromMap(item))
        .toList();
  }
}