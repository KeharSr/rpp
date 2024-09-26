import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpp/features/notice/domain/entity/news_entity.dart';
import 'package:rpp/features/notice/presentation/view_modal/news_view_modal.dart';
import 'package:rpp/features/single_news/presentation/view/single_news_view.dart';

class NewsView extends ConsumerStatefulWidget {
  const NewsView({super.key});

  @override
  ConsumerState<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends ConsumerState<NewsView> {
  @override
  void initState() {
    super.initState();
    // Make backend call without changing the UI
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchNewsIfNeeded();
    });
  }

  void _fetchNewsIfNeeded() {
    if (!ref.read(newsViewModelProvider).isLoading &&
        ref.read(newsViewModelProvider).newsList.isEmpty) {
      ref.read(newsViewModelProvider.notifier).fetchNews();
    }
  }

  @override
  Widget build(BuildContext context) {
    final newsState = ref.watch(newsViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('News',
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: newsState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : newsState.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline,
                          size: 60, color: Colors.red),
                      const SizedBox(height: 16),
                      Text(
                        'Error: ${newsState.error}',
                        style: GoogleFonts.roboto(
                            color: Colors.red[700], fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _fetchNewsIfNeeded,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () async => _fetchNewsIfNeeded(),
                  child: ListView.builder(
                    itemCount: newsState.newsList.length,
                    itemBuilder: (context, index) {
                      final news = newsState.newsList[index];
                      return index == 0
                          ? _buildFeaturedCard(news)
                          : _buildNewsCard(news);
                    },
                  ),
                ),
    );
  }

  Widget _buildFeaturedCard(NewsEntity news) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SingleNewsView(news: news)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  '${news.imageUrl}',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured: ${news.title}',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    news.createdAt,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Html(
                    data: news.content ?? '',
                    style: {
                      "body": Style(
                        fontSize: FontSize(14),
                        lineHeight: const LineHeight(1.4),
                        color: Colors.black87,
                        maxLines: 3,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(NewsEntity news) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SingleNewsView(news: news)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      news.createdAt,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Html(
                      data: news.content ?? '',
                      style: {
                        "body": Style(
                          fontSize: FontSize(14),
                          lineHeight: const LineHeight(1.4),
                          color: Colors.black87,
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  news.imageUrl,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Text('Error loading image');
                  },
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
