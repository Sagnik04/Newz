import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newz_2/features/business/business_ui_models/models.dart';

import '../../home/post_ui_models/posts_ui_models.dart';
import '../../home/repos/posts_repo.dart';
import '../repo/business_repo.dart';

part 'business_event.dart';
part 'business_state.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  List<PostBUiModel> _allPostsB = [];
  BusinessBloc() : super(BusinessInitial()) {
    on<PostBFetchEvent>(postBFetchEvent);
    on<SearchPostBEvent>(searchPostBEvent);
  }

  FutureOr<void> searchPostBEvent(
      SearchPostBEvent event, Emitter<BusinessState> emit) {
    emit(PostBFetchLoadingState());
    try {
      final filteredPostsB = _allPostsB
          .where((postB) =>
              postB.title.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(PostBFetchSuccessfulState(postB: filteredPostsB));
    } catch (e) {
      emit(PostBFetchErrorState());
    }
  }

  Future<FutureOr<void>> postBFetchEvent(
      PostBFetchEvent event, Emitter<BusinessState> emit) async {
    final List<PostBUiModel> postsB = await PostsBRepo.fetchpost();
    _allPostsB = postsB;
    emit(PostBFetchSuccessfulState(postB: postsB));
  }
}
