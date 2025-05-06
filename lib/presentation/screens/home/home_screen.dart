import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_with_bloc/core/extensions/extensions.dart';
import 'package:ecommerce_with_bloc/core/widgets/decorated_scaffold.dart';
import 'package:ecommerce_with_bloc/presentation/screens/home/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return DecoratedScaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          // -----------------------------------
          // Default App bar
          // -----------------------------------
          SliverAppBar(
            pinned: true,
            toolbarHeight: kToolbarHeight,
            automaticallyImplyLeading: false,
            title: Text("Best Deals", style: theme.textTheme.headlineLarge),
            actions: [const Icon(LucideIcons.shoppingCart).padAt(right: 20)],
          ),

          // -----------------------------------
          // Search Bar
          // -----------------------------------
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            expandedHeight: 40,
            toolbarHeight: 40,
            flexibleSpace: TextFormField(
              decoration: const InputDecoration(
                hintText: "Search product",
                prefixIcon: Icon(LucideIcons.search),
              ),
            ).padAt(horizontal: 20),
          ),

          // -----------------------------------
          // Banner Image
          // -----------------------------------
          SliverAppBar(
            pinned: false,
            automaticallyImplyLeading: false,
            expandedHeight: screenHeight * .2,
            toolbarHeight: screenHeight * .2,
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/images/deal_image.jpg",
                fit: BoxFit.cover,
              ),
            ).padAt(horizontal: 20, vertical: 10),
          ),

          // -----------------------------------
          // Categories
          // -----------------------------------
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            expandedHeight: 126,
            toolbarHeight: 126,
            flexibleSpace: Column(
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
                    itemCount: 12,
                    itemExtent: 120,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.only(right: 6),
                        elevation: 1,
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
                              "Women's Jwellery",
                              style: theme.textTheme.labelLarge,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ).padAt(top: 10),
              ],
            ),
          ),
        ],
        body: ProductList(),
      ),
    );
  }
}
