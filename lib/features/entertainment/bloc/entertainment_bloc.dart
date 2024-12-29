import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newz_2/features/entertainment/entertainment_repo/repo.dart';

import '../entertainment_model/entertainment_ui_models.dart';

part 'entertainment_event.dart';
part 'entertainment_state.dart';

class EntertainmentBloc extends Bloc<EntertainmentEvent, EntertainmentState> {
  List<PostEUiModel> _allPosts = [];
  EntertainmentBloc() : super(EntertainmentInitial()) {
    on<PostEfetchSuccessfulEvent>(postEfetchSuccessfulEvent);
    on<SearchPostEEvent>(searchPostEEvent);
  }

  Future<FutureOr<void>> postEfetchSuccessfulEvent(PostEfetchSuccessfulEvent event, Emitter<EntertainmentState> emit) async {
    emit(PostEFetchLoadingState());
   try{
     final List <PostEUiModel> post = await PostERepo.fetchpost();
     _allPosts = post;
     emit(PostEFetchSuccessfulState(post: post));
   }catch(e){
     emit(PostEFetchErrorState());
   }
  }

  FutureOr<void> searchPostEEvent(SearchPostEEvent event, Emitter<EntertainmentState> emit) {
    final filteredPosts = _allPosts
        .where((post) => post.title.toLowerCase().contains(event.query.toLowerCase()))
        .toList();
    emit(PostEFetchSuccessfulState(post: filteredPosts));
  }
}
