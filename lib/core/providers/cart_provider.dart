import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Model for a cart item
@immutable
class CartItem {
  final String productId;
  final String name;
  final String price;
  final int quantity;

  const CartItem({
    required this.productId,
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  double get numericPrice => double.tryParse(price.replaceAll('\$', '')) ?? 0;
  double get total => numericPrice * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      productId: productId,
      name: name,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }
}

/// State notifier for the cart
class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(CartItem item) {
    final index = state.indexWhere((e) => e.productId == item.productId);
    if (index >= 0) {
      final updated = [...state];
      updated[index] = updated[index].copyWith(
        quantity: updated[index].quantity + item.quantity,
      );
      state = updated;
    } else {
      state = [...state, item];
    }
  }

  void removeItem(String productId) {
    state = state.where((e) => e.productId != productId).toList();
  }

  void clearCart() {
    state = [];
  }

  double get subtotal => state.fold(0, (sum, item) => sum + item.total);
  double get taxes => subtotal * 0.02; // ~2%
  double get deliveryFees => state.isEmpty ? 0 : 1.5;
  double get grandTotal => subtotal + taxes + deliveryFees;
  int get totalItems => state.fold(0, (sum, item) => sum + item.quantity);
}

/// Provider
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
