import 'package:ecommerce_with_bloc/core/services/locator_service.dart';
import 'package:ecommerce_with_bloc/data/local/hive_db.dart';
import 'package:ecommerce_with_bloc/data/models/cart/cart_item.dart';
import 'package:ecommerce_with_bloc/data/models/cart/cart_model.dart';
import 'package:ecommerce_with_bloc/data/models/product/product_model.dart';
import 'package:ecommerce_with_bloc/domain/cart_repository.dart';
import 'package:ecommerce_with_bloc/domain/product_repository.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/home/home_events.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final ProductRepository _productRepository = locator.get();
  final CartRepository _cartRepository = locator.get();

  HomeBloc() : super(const HomeStates.initial()) {
    on<FetchInitialData>(_onFetchInitialData);
    on<AddToCart>(_onAddToCart);
  }

  // -----------------------------------
  // Initial Data Load
  // -----------------------------------
  Future<void> _onFetchInitialData(
    FetchInitialData event,
    Emitter<HomeStates> emit,
  ) async {
    emit(const HomeStates.loading());

    try {
      final categoriesFuture = _productRepository.fetchingCategories();
      final productsFuture = _productRepository.fetchingProducts();

      final results = await Future.wait([
        categoriesFuture,
        productsFuture,
      ], eagerError: false);

      emit(HomeStates.loaded(
        categories: results[0] as List<String>,
        products: results[1] as List<ProductModel>,
      ));
    } catch (e) {
      emit(
        const HomeStates.loaded(categories: [], products: []),
      );
    }
  }

  // -----------------------------------
  // Add Product TO Cart
  // -----------------------------------
  Future<void> _onAddToCart(AddToCart event, Emitter<HomeStates> emit) async {
    emit(
      state.maybeWhen(
          loaded: (categories, products, addToCartIndex) => HomeStates.loaded(
              categories: categories,
              products: products,
              addToCartIndex: event.index),
          orElse: HomeStates.initial),
    );

    await _cartRepository.addProductToCart(product: event.product);
    Future.delayed(const Duration(milliseconds: 600));
    emit(
      state.maybeWhen(
          loaded: (categories, products, addToCartIndex) => HomeStates.loaded(
                categories: categories,
                products: products,
                addToCartIndex: null,
              ),
          orElse: HomeStates.initial),
    );
  }
}
