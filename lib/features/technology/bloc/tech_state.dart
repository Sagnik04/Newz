part of 'tech_bloc.dart';

@immutable
sealed class TechState {}
sealed class TechActionState extends TechState{}

final class TechInitial extends TechState {}

class PostTFetchSuccessfulState extends TechState{

  final List<PostTUiModel> post;


  PostTFetchSuccessfulState({required this.post});}
class PostTFetchLoadingState extends TechState{}


class PostTFetchErrorState extends TechState{}
