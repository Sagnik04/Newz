part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
sealed class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}
class PostFetchSuccessfulState extends HomeState{

  final List<PostUiModel> post;


  PostFetchSuccessfulState({required this.post});}
class PostFetchLoadingState extends HomeState{}
class PostFetchErrorState extends HomeState{}
