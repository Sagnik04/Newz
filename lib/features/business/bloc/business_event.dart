part of 'business_bloc.dart';

@immutable
sealed class BusinessEvent {}



class PostBFetchEvent extends BusinessEvent{}

class SearchPostBEvent extends BusinessEvent {
  final String query;

  SearchPostBEvent(this.query);
}
