import 'package:fruits_hub/Core/entities/product_entity.dart';

// abstract class FavouriteStates{}
//
// class FavouriteInitial extends FavouriteStates{}
// class FavouriteUpdated extends   FavouriteStates{
//
//   final List<ProductEntity> items;
//   FavouriteUpdated(this.items);
// }
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object?> get props => [];
}

/// Initial state before anything happens
class FavouriteInitial extends FavouriteState {}

/// Loading state (e.g. while fetching favourites)
class FavouriteLoading extends FavouriteState {}

/// Updated state with current favourites list
class FavouriteUpdated extends FavouriteState {
  final List<ProductEntity> items;

  const FavouriteUpdated(this.items);

  @override
  List<Object?> get props => [items];
}

/// Error state
class FavouriteError extends FavouriteState {
  final String message;

  const FavouriteError(this.message);

  @override
  List<Object?> get props => [message];
}
