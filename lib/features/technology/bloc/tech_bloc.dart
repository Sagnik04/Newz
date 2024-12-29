import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newz_2/features/technology/repo/tech_repo.dart';
import 'package:newz_2/features/technology/tech_models/tech_ui_models.dart';

part 'tech_event.dart';
part 'tech_state.dart';

class TechBloc extends Bloc<TechEvent,TechState> {
  List<PostTUiModel> _allPosts = [];
  TechBloc() : super(TechInitial()) {
    on<PostTFetchEvent>(postTFetchEvent);
    on<SearchPostTEvent>(searchPostTEvent);
  }

  Future<FutureOr<void>> postTFetchEvent(PostTFetchEvent event, Emitter<TechState> emit) async {
    emit(PostTFetchLoadingState());

    try{
      final List<PostTUiModel> posts = await PostsTRepo.fetchpost();
      _allPosts = posts;
      emit(PostTFetchSuccessfulState(post: posts));
    }catch(e){
      emit(PostTFetchErrorState());
    }
  }

  FutureOr<void> searchPostTEvent(SearchPostTEvent event, Emitter<TechState> emit) {
  }
}
