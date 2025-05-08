import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_with_bloc/core/extensions/extensions.dart';
import 'package:ecommerce_with_bloc/core/routes/app_route.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/home/home_bloc.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/home/home_events.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/home/home_states.dart';
import 'package:ecommerce_with_bloc/presentation/screens/home/widgets/category_list.dart';
import 'package:ecommerce_with_bloc/presentation/screens/home/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // -----------------------------------
  // Functions
  // -----------------------------------
  void _onCartTap() {
    context.router.pushNamed(AppRouter.cart);
  }

  // -----------------------------------
  // Init State
  // -----------------------------------
  @override
  void initState() {
    context.read<HomeBloc>().add(const FetchInitialData());
    super.initState();
  }

  // -----------------------------------
  // Build
  // -----------------------------------
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeStates>(
          builder: (context, state) {
            return state.when(
              // -----------------------------------
              // Initial State
              // -----------------------------------
              initial: () => const SizedBox(),

              // -----------------------------------
              // Loading State
              // -----------------------------------
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),

              // -----------------------------------
              // Loaded State
              // -----------------------------------
              loaded: (categories, products, addingIndex) => NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  // -----------------------------------
                  // Default App bar
                  // -----------------------------------
                  SliverAppBar(
                    pinned: true,
                    toolbarHeight: kToolbarHeight,
                    automaticallyImplyLeading: false,
                    title: Text("Best Deals",
                        style: theme.textTheme.headlineLarge),
                    actions: [
                      // -----------------------------------
                      // Cart Button
                      // -----------------------------------
                      InkWell(
                        onTap: _onCartTap,
                        borderRadius: BorderRadius.circular(kToolbarHeight),
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            LucideIcons.shoppingCart,
                          ),
                        ),
                      ).padAt(right: 16)
                    ],
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
                      child: Container(
                        color: theme.colorScheme.onSurface,
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: Image.asset(
                          "assets/images/deal_image.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ).padAt(horizontal: 20, vertical: 10),
                  ),

                  // -----------------------------------
                  // Categories
                  // -----------------------------------
                  SliverAppBar(
                    pinned: true,
                    automaticallyImplyLeading: false,
                    expandedHeight: 136,
                    toolbarHeight: 136,
                    flexibleSpace: CategoryList(categories: categories),
                  ),
                ],

                // -----------------------------------
                // Products
                // -----------------------------------
                body: ProductList(
                  products: products,
                  addingIndex: addingIndex,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
