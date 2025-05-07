import 'package:ecommerce_with_bloc/core/services/locator_service.dart';
import 'package:ecommerce_with_bloc/data/models/product/product_model.dart';
import 'package:ecommerce_with_bloc/domain/product_repository.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/home/home_events.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final ProductRepository _productRepository = locator.get();

  HomeBloc() : super(const HomeStates.initial()) {
    on<FetchInitialData>(_onFetchInitialData);
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
}
