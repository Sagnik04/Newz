import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newz_2/features/home/post_ui_models/posts_ui_models.dart';
import 'package:newz_2/features/home/repos/posts_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<PostUiModel> _allPosts = [];
  HomeBloc() : super(HomeInitial()) {
   on<PostFetchEvent>(postFetchEvent);
   on<SearchPostEvent>(searchPostEvent);
  }

  Future<FutureOr<void>> postFetchEvent(PostFetchEvent event, Emitter<HomeState> emit) async {
    emit(PostFetchLoadingState());
    try{
      final List<PostUiModel> posts = await PostsRepo.fetchpost();
      _allPosts = posts;
      emit(PostFetchSuccessfulState(post: posts));
    }catch(e){
      emit(PostFetchErrorState());
    }
  }

  FutureOr<void> searchPostEvent(SearchPostEvent event, Emitter<HomeState> emit) {

    final filteredPosts = _allPosts
        .where((post) => post.title.toLowerCase().contains(event.query.toLowerCase()))
        .toList();
    emit(PostFetchSuccessfulState(post: filteredPosts));
  }
}
