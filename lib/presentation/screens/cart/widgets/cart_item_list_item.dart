import 'package:ecommerce_with_bloc/core/extensions/extensions.dart';
import 'package:ecommerce_with_bloc/core/widgets/cut_rectangle_clipper.dart';
import 'package:ecommerce_with_bloc/core/widgets/cut_rectangle_shape.dart';
import 'package:ecommerce_with_bloc/data/models/cart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CartItemListItem extends StatefulWidget {
  final CartItem item;
  final int index;
  final VoidCallback onRemoveTap;
  final VoidCallback onIncreaseTap;
  final VoidCallback onDecreaseTap;

  const CartItemListItem(
      {super.key,
      required this.item,
      required this.onRemoveTap,
      required this.onIncreaseTap,
      required this.onDecreaseTap,
      required this.index});

  @override
  State<CartItemListItem> createState() => _CartItemListItemState();
}

class _CartItemListItemState extends State<CartItemListItem> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return CustomPaint(
      painter: CutRectangleShape(widget.index % 2 == 0),
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.all(4),
        child: ClipPath(
          clipper: CutRectangleClipper(widget.index % 2 == 0),
          child: Container(
            color: theme.colorScheme.onSurface,
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -----------------------------------
                  // Product Image
                  // -----------------------------------
                  ClipPath(
                    clipper: CutRectangleClipper(widget.index % 2 == 0),
                    child: Container(
                      width: 100,
                      height: double.maxFinite,
                      color: Colors.white,
                      child: Image.network(
                        widget.item.product?.image ?? '',
                        height: double.maxFinite,
                        width: double.maxFinite,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(6),
                            child:
                                Placeholder(color: theme.colorScheme.outline),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              color: theme.colorScheme.primary,
                            ),
                          );
                        },
                      ).padAt(all: 4),
                    ),
                  ).padAt(right: 10),

                  // -----------------------------------
                  // Product Details
                  // -----------------------------------
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.item.product?.title ?? '',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.colorScheme.surface,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ).padAt(bottom: 4),
                        Text(
                          (widget.item.product?.price?.formatCurrency() ??
                              0.formatCurrency()),
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.surface,
                          ),
                        ).padAt(bottom: 6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 40,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: theme.colorScheme.outline,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // -----------------------------------
                                    // Decrease
                                    // -----------------------------------
                                    IconButton(
                                      onPressed: widget.onDecreaseTap,
                                      splashColor: theme.colorScheme.primary
                                          .withOpacity(0.1),
                                      icon: Icon(
                                        LucideIcons.minus,
                                        color: theme.colorScheme.error,
                                      ),
                                    ),

                                    // -----------------------------------
                                    // Count
                                    // -----------------------------------
                                    Expanded(
                                      child: Text(
                                        widget.item.count?.toStringAsFixed(0) ??
                                            "0",
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                          color: theme.colorScheme.surface,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                    // -----------------------------------
                                    // Increase
                                    // -----------------------------------
                                    IconButton(
                                      onPressed: widget.onIncreaseTap,
                                      splashColor: theme.colorScheme.primary
                                          .withOpacity(0.1),
                                      icon: Icon(
                                        LucideIcons.plus,
                                        color: theme.colorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),

                            // -----------------------------------
                            // Remove
                            // -----------------------------------
                            IconButton(
                              onPressed: widget.onRemoveTap,
                              splashColor:
                                  theme.colorScheme.primary.withOpacity(0.1),
                              icon: Icon(
                                LucideIcons.trash,
                                color: theme.colorScheme.error,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ).padAt(bottom: 6);
  }
}
