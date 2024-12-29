part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}



class PostFetchEvent extends HomeEvent{}

class SearchPostEvent extends HomeEvent {
  final String query;

  SearchPostEvent(this.query);
}
