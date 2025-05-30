import 'package:ecommerce_with_bloc/core/extensions/extensions.dart';
import 'package:ecommerce_with_bloc/core/widgets/cut_rectangle_clipper.dart';
import 'package:ecommerce_with_bloc/core/widgets/cut_rectangle_clipper_bottom.dart';
import 'package:ecommerce_with_bloc/core/widgets/cut_rectangle_shape.dart';
import 'package:ecommerce_with_bloc/data/models/product/product_model.dart';
import 'package:ecommerce_with_bloc/main.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/home/home_bloc.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/home/home_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProductListItem extends StatefulWidget {
  final int index;
  final int? addingIndex;
  final ProductModel product;

  const ProductListItem(
      {super.key,
      required this.index,
      required this.product,
      this.addingIndex});

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem>
    with AutomaticKeepAliveClientMixin {
  // -----------------------------------
  // Functions
  // -----------------------------------
  void _onItemTap() {}

  void _onCartTap() {
    context.read<HomeBloc>().add(
        HomeEvents.addToCart(index: widget.index, product: widget.product));
  }

  // -----------------------------------
  // Build
  // -----------------------------------
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = context.theme;
    return CustomPaint(
      painter: CutRectangleShape(widget.index % 2 != 0),
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            // -----------------------------------
            // Product Image
            // -----------------------------------
            Positioned(
              left: 4,
              top: 4,
              bottom: 4,
              right: 4,
              child: ClipPath(
                clipper: CutRectangleClipper(widget.index % 2 != 0),
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.white,
                  child: Image.network(
                    widget.product.image ?? '',
                    height: double.maxFinite,
                    width: double.maxFinite,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(6),
                        child: Placeholder(color: theme.colorScheme.outline),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          color: theme.colorScheme.primary,
                        ),
                      );
                    },
                  ).padAt(all: 4),
                ),
              ),
            ),

            // -----------------------------------
            // Product Details
            // -----------------------------------
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: ClipPath(
                  clipper: CutRectangleClipperBottom(widget.index % 2 != 0),
                  child: Container(
                    color: theme.scaffoldBackgroundColor.withOpacity(0.8),
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.product.title ?? '',
                          style: theme.textTheme.labelLarge,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ).padAt(bottom: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.product.price?.formatCurrency() ??
                                  (0.formatCurrency()),
                              style: theme.textTheme.titleMedium,
                            ),
                            const Spacer(),
                            Icon(
                              LucideIcons.star,
                              color: theme.colorScheme.onSurface,
                              size: 12,
                            ).padAt(right: 4),
                            Text(
                              widget.product.rating?.count
                                      ?.toStringAsFixed(2) ??
                                  '0.0',
                              style: theme.textTheme.titleSmall,
                            ),
                          ],
                        ).padAt(bottom: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // -----------------------------------
            // On Tap
            // -----------------------------------
            Positioned(
              left: 4,
              top: 4,
              right: 4,
              bottom: 4,
              child: ClipPath(
                clipper: CutRectangleClipper(widget.index % 2 != 0),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: _onItemTap,
                    splashColor: theme.colorScheme.primary.withOpacity(0.1),
                  ),
                ),
              ),
            ),

            // -----------------------------------
            // Add To Cart
            // -----------------------------------
            Positioned(
              top: 8,
              left: widget.index % 2 != 0 ? 8 : null,
              right: widget.index % 2 == 0 ? 8 : null,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap:
                        widget.addingIndex == widget.index ? null : _onCartTap,
                    borderRadius: BorderRadius.circular(32),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: widget.addingIndex == widget.index
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: theme.colorScheme.onSurface,
                              ),
                            )
                          : Icon(
                              LucideIcons.shoppingCart,
                              size: 20,
                              color: theme.colorScheme.onSurface,
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
