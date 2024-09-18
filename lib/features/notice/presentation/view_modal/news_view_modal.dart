import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/core/common/my_snackbar.dart';
import 'package:rpp/features/notice/domain/usecase/news_usecase.dart';
import 'package:rpp/features/notice/presentation/state/news_state.dart';

final newsViewModelProvider = StateNotifierProvider<NewsViewModel, NewsState>(
  (ref) => NewsViewModel(ref.read(newsUsecaseProvider)),
);

class NewsViewModel extends StateNotifier<NewsState> {
  NewsViewModel(this.newsUsecase) : super(NewsState.initial());

  final NewsUseCase newsUsecase;

  Future<void> fetchNews() async {
    state = state.copyWith(isLoading: true);

    final result = await newsUsecase.getNews();

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
          isLoadSuccess: false,
        );
        showMySnackBar(message: failure.error, color: Colors.red);
      },
      (newsList) {
        state = state.copyWith(
          isLoading: false,
          newsList: newsList,
          isLoadSuccess: true,
        );
      },
    );
  }
}
