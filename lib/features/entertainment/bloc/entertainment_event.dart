part of 'entertainment_bloc.dart';

@immutable
sealed class EntertainmentEvent {}
class PostEfetchSuccessfulEvent extends EntertainmentEvent{}


class SearchPostEEvent extends EntertainmentEvent {
  final String query;

  SearchPostEEvent(this.query);
}
