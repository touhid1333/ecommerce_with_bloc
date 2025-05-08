import 'package:auto_route/annotations.dart';
import 'package:ecommerce_with_bloc/core/extensions/extensions.dart';
import 'package:ecommerce_with_bloc/data/models/cart/cart_item.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/cart/cart_events.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/cart/cart_states.dart';
import 'package:ecommerce_with_bloc/presentation/screens/cart/widgets/cart_item_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _onClearTap() {
    context.read<CartBloc>().add(const CartEvents.clearCart());
  }

  @override
  void initState() {
    context.read<CartBloc>().add(const CartEvents.fetchCartDetails());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Cart", style: theme.textTheme.headlineLarge),
        actions: [
          // -----------------------------------
          // Clear Button
          // -----------------------------------
          BlocBuilder<CartBloc, CartStates>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (cartDetails) => TextButton(
                  onPressed: _onClearTap,
                  child: Text(
                    "Clear  Cart",
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.error,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ).padAt(right: 16),
                orElse: () => const SizedBox(),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<CartBloc, CartStates>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => Center(
                child: CircularProgressIndicator(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              loaded: (cartDetails) => ((cartDetails.cartItems?.length ?? 0) ==
                      0)
                  ? Center(
                      child: Text(
                        "Cart is empty.",
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cartDetails.cartItems?.length ?? 0,
                            padding: const EdgeInsets.all(20),
                            itemExtent: 160,
                            itemBuilder: (context, index) {
                              var item = cartDetails.cartItems![index];

                              // -----------------------------------
                              // Cart Item
                              // -----------------------------------
                              return CartItemListItem(
                                  item: item,
                                  onRemoveTap: () {
                                    context.read<CartBloc>().add(
                                        CartEvents.removeCartItem(item: item));
                                  },
                                  onIncreaseTap: () {
                                    CartItem updateItem =
                                        CartItem.fromJson(item.toJson());
                                    int increase = (updateItem.count ?? 0) + 1;
                                    updateItem = updateItem.copyWith(
                                      totalPrice:
                                          (updateItem.product?.price ?? 0) *
                                              increase,
                                      count: increase,
                                    );
                                    context.read<CartBloc>().add(
                                        CartEvents.updateCartItem(
                                            item: updateItem));
                                  },
                                  onDecreaseTap: () {
                                    CartItem updateItem =
                                        CartItem.fromJson(item.toJson());
                                    if ((updateItem.count ?? 0) > 1) {
                                      int decrease =
                                          (updateItem.count ?? 0) - 1;
                                      updateItem = updateItem.copyWith(
                                        totalPrice:
                                            (updateItem.product?.price ?? 0) *
                                                decrease,
                                        count: decrease,
                                      );
                                      context.read<CartBloc>().add(
                                          CartEvents.updateCartItem(
                                              item: updateItem));
                                    }
                                  },
                                  index: index);
                            },
                          ),
                        ),
                        Container(
                          height: 120,
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Total Price ",
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      color: theme.colorScheme.onSurface,
                                    ),
                                  ),
                                  Text(
                                    "(${cartDetails.totalCartCount ?? 0})",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.onSurface,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      cartDetails.totalCartPrice
                                              ?.formatCurrency() ??
                                          0.formatCurrency(),
                                      style:
                                          theme.textTheme.titleLarge?.copyWith(
                                        color: theme.colorScheme.onSurface,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  )
                                ],
                              ).padAt(bottom: 6),
                              SizedBox(
                                width: double.maxFinite,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Check Out",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}
