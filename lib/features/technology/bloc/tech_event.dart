part of 'tech_bloc.dart';

@immutable
sealed class TechEvent {}



class PostTFetchEvent extends TechEvent{}

class SearchPostTEvent extends TechEvent {
  final String query;

  SearchPostTEvent(this.query);
}