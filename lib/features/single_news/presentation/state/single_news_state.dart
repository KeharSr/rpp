import 'package:rpp/features/notice/domain/entity/news_entity.dart';

class SingleNewsState {
  final bool isLoading;
  final bool isLoaded;
  final bool isError;
  final String? error;
  final String errorMessage;
  final NewsEntity? singleNews;

  SingleNewsState({
    this.isLoading = false,
    this.isLoaded = false,
    this.isError = false,
    this.errorMessage = '',
    this.error,
    this.singleNews,
  });

  factory SingleNewsState.initial() {
    return SingleNewsState(
      isLoading: false,
      isLoaded: false,
      isError: false,
      errorMessage: '',
      singleNews: null,
    );
  }

  SingleNewsState copyWith({
    bool? isLoading,
    bool? isLoaded,
    bool? isError,
    String? error,
    String? errorMessage,
    NewsEntity? singleNews,
  }) {
    return SingleNewsState(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      singleNews: singleNews ?? this.singleNews,
      error: error ?? this.error,
    );
  }
}
