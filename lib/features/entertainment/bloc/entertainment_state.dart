part of 'entertainment_bloc.dart';

@immutable
sealed class EntertainmentState {}
sealed class EntertainmentActionState extends EntertainmentState{}

final class EntertainmentInitial extends EntertainmentState {}
class PostEFetchSuccessfulState extends EntertainmentState{

  final List<PostEUiModel> post;

  PostEFetchSuccessfulState({required this.post});
}
class PostEFetchLoadingState extends EntertainmentState{}
class PostEFetchErrorState extends EntertainmentState{}
