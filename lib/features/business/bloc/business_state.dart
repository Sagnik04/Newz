part of 'business_bloc.dart';

@immutable
sealed class BusinessState {}
sealed class BusinessActionState extends BusinessState{}

final class BusinessInitial extends BusinessState {}

class PostBFetchSuccessfulState extends BusinessState{

  final List<PostBUiModel> postB;


  PostBFetchSuccessfulState({required this.postB});}


class PostBFetchLoadingState extends BusinessState{}
class PostBFetchErrorState extends BusinessState{}
