import 'package:ecommerce_with_bloc/core/services/locator_service.dart';
import 'package:ecommerce_with_bloc/domain/cart_repository.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/cart/cart_events.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/cart/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvents, CartStates> {
  final CartRepository _cartRepository = locator.get();

  CartBloc() : super(const CartStates.initial()) {
    on<FetchCartDetails>(_onFetchCartDetails);
    on<UpdateCartItem>(_onUpdateCartItem);
    on<RemoveCartItem>(_onRemoveCartItem);
    on<ClearCart>(_onClearCart);
  }

  // -----------------------------------
  // Initial Data Load
  // -----------------------------------
  Future<void> _onFetchCartDetails(
    FetchCartDetails event,
    Emitter<CartStates> emit,
  ) async {
    emit(const CartStates.loading());
    final cartDetails = _cartRepository.getCartDetails();
    await Future.delayed(const Duration(milliseconds: 600));
    emit(
      CartStates.loaded(
        cartDetails: cartDetails,
      ),
    );
  }

  // -----------------------------------
  // Update Cart
  // -----------------------------------
  Future<void> _onUpdateCartItem(
    UpdateCartItem event,
    Emitter<CartStates> emit,
  ) async {
    await _cartRepository.updateProductInCart(item: event.item);
    emit(
      CartStates.loaded(
        cartDetails: _cartRepository.getCartDetails(),
      ),
    );
  }

  // -----------------------------------
  // Remove Cart
  // -----------------------------------
  void _onRemoveCartItem(
    RemoveCartItem event,
    Emitter<CartStates> emit,
  ) async {
    await _cartRepository.deleteItemFromCart(item: event.item);
    emit(
      CartStates.loaded(
        cartDetails: _cartRepository.getCartDetails(),
      ),
    );
  }

  // -----------------------------------
  // Remove Cart
  // -----------------------------------
  Future<void> _onClearCart(
    ClearCart event,
    Emitter<CartStates> emit,
  ) async {
    await _cartRepository.clearCart();
    emit(
      CartStates.loaded(
        cartDetails: _cartRepository.getCartDetails(),
      ),
    );
  }
}
