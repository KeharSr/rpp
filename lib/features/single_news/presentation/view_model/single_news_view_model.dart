import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/features/notice/domain/usecase/news_usecase.dart';
import 'package:rpp/features/single_news/presentation/state/single_news_state.dart';

final singleNewsViewModelProvider =
    StateNotifierProvider((ref) => SingleNewsViewModel(
          newsUseCase: ref.read(newsUsecaseProvider),
        ));

class SingleNewsViewModel extends StateNotifier<SingleNewsState> {
  SingleNewsViewModel({required this.newsUseCase}) : super(SingleNewsState());
  final NewsUseCase newsUseCase;

  Future<void> getNewsById(int id) async {
    state = state.copyWith(isLoading: true);
    final result = await newsUseCase.getNewsById(id);
    result.fold(
      (failure) => state =
          state.copyWith(isLoading: false, isError: true, error: failure.error),
      (news) => state = state.copyWith(isLoaded: true, singleNews: news),
    );
  }
}
