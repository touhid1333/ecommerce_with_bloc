import 'package:ecommerce_with_bloc/core/extensions/extensions.dart';
import 'package:ecommerce_with_bloc/core/widgets/cut_rectangle_shape.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CategoryListItem extends StatefulWidget {
  final String category;
  final int index;

  const CategoryListItem(
      {super.key, required this.category, required this.index});

  @override
  State<CategoryListItem> createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: CustomPaint(
        painter: CutRectangleShape(widget.index % 2 == 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LucideIcons.mousePointerClick,
              size: 24,
              color: theme.colorScheme.onSurface,
            ).padAt(bottom: 4),
            Text(
              widget.category.toUpperCase(),
              style: theme.textTheme.labelLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
