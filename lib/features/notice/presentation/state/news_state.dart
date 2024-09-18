import 'package:equatable/equatable.dart';
import 'package:rpp/features/notice/domain/entity/news_entity.dart';

class NewsState extends Equatable {
  final bool isLoading;
  final List<NewsEntity> newsList;
  final String? error;
  final bool isLoadSuccess;

  const NewsState({
    required this.isLoading,
    required this.newsList,
    this.error,
    required this.isLoadSuccess,
  });

  factory NewsState.initial() => const NewsState(
        isLoading: false,
        newsList: [],
        isLoadSuccess: false,
      );

  NewsState copyWith({
    bool? isLoading,
    List<NewsEntity>? newsList,
    String? error,
    bool? isLoadSuccess,
  }) {
    return NewsState(
      isLoading: isLoading ?? this.isLoading,
      newsList: newsList ?? this.newsList,
      error: error ?? this.error,
      isLoadSuccess: isLoadSuccess ?? this.isLoadSuccess,
    );
  }

  @override
  List<Object?> get props => [isLoading, newsList, error, isLoadSuccess];
}
