import 'package:ecommerce_with_bloc/core/extensions/extensions.dart';
import 'package:ecommerce_with_bloc/core/extensions/widget_extensions.dart';
import 'package:ecommerce_with_bloc/core/widgets/cut_rectangle_clipper.dart';
import 'package:ecommerce_with_bloc/core/widgets/cut_rectangle_shape.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProductListItem extends StatelessWidget {
  final int index;

  const ProductListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return CustomPaint(
      painter: CutRectangleShape(index % 2 != 0),
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipPath(
                    clipper: CutRectangleClipper(index % 2 != 0),
                    child: Container(
                      width: double.maxFinite,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 2,
                            blurRadius: 2,
                            blurStyle: BlurStyle.inner,
                          )
                        ],
                      ),
                      child: Image.network(
                        "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                        height: 90,
                        width: double.maxFinite,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ).padAt(bottom: 6),
                  Text(
                    "Mens Casual Premium Slim Fit T-Shirts",
                    style: theme.textTheme.labelLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ).padAt(bottom: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        109.95.formatCurrency(),
                        style: theme.textTheme.titleMedium,
                      ),
                      const Spacer(),
                      Icon(
                        LucideIcons.star,
                        color: theme.colorScheme.onSurface,
                        size: 12,
                      ).padAt(right: 4),
                      Text(
                        4.9.toStringAsFixed(2),
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 6,
              left: index % 2 == 0 ? 6 : null,
              right: index % 2 != 0 ? 6 : null,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: theme.colorScheme.outline,
                    borderRadius: BorderRadius.circular(26)),
                child: Icon(
                  LucideIcons.shoppingCart,
                  size: 14,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
