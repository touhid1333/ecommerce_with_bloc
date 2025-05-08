import 'package:ecommerce_with_bloc/core/extensions/extensions.dart';
import 'package:ecommerce_with_bloc/data/models/product/product_model.dart';
import 'package:ecommerce_with_bloc/presentation/screens/home/widgets/product_list_item.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  final List<ProductModel> products;
  final int? addingIndex;

  const ProductList({super.key, required this.products, this.addingIndex});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Grab Now",
          style: theme.textTheme.headlineSmall,
        ).padAt(left: 20, right: 20, top: 20),

        // -----------------------------------
        // Product Grid
        // -----------------------------------
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 220,
                mainAxisSpacing: 5,
                crossAxisSpacing: 10),
            itemCount: widget.products.length,
            itemBuilder: (context, index) {
              final item = widget.products[index];

              // -----------------------------------
              // Item View
              // -----------------------------------
              return TweenAnimationBuilder(
                duration: const Duration(milliseconds: 400),
                tween: Tween(begin: 0.0, end: 1.0),
                curve: Curves.easeIn,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.scale(
                      scale: value,
                      child: child,
                    ),
                  );
                },
                child: ProductListItem(
                  index: index,
                  product: item,
                  addingIndex: widget.addingIndex,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
