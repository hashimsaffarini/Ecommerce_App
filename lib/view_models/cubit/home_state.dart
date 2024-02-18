part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<ProductItemModel> products;
  final List<AnnouncementModel> announcements;
  HomeLoaded(this.products, this.announcements);
}

final class HomeError extends HomeState {
  final String messege;

  HomeError(this.messege);
}

final class FavoriteChanged extends HomeState {
  final List<ProductItemModel> fav;

  FavoriteChanged(this.fav);
}

final class HomeCategoriesLoaded extends HomeState {
  final List<List<CategoriesModel>> categories;

  HomeCategoriesLoaded(this.categories);
}

final class HomeCategoriesError extends HomeState {
  final String messege;

  HomeCategoriesError(this.messege);
}

final class HomeCategoriesLoading extends HomeState {}
