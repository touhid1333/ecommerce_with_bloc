import 'package:ecommerce_with_bloc/core/extensions/extensions.dart';
import 'package:ecommerce_with_bloc/presentation/screens/home/widgets/category_list_item.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CategoryList extends StatefulWidget {
  final List<String> categories;

  const CategoryList({super.key, required this.categories});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Categories", style: theme.textTheme.headlineSmall)
            .padAt(left: 20, right: 20, top: 10),
        SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: widget.categories.length,
            itemExtent: 140,
            itemBuilder: (context, index) {
              var item = widget.categories[index];

              return CategoryListItem(
                category: item,
                index: index,
              );
            },
          ),
        ).padAt(top: 10),
      ],
    );
  }
}
