import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/features/notice/presentation/view_modal/news_view_modal.dart';

class NewsView extends ConsumerWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(newsViewModelProvider);

    // Fetch news data when the view is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (newsState.isLoading == false && newsState.newsList.isEmpty) {
        ref.read(newsViewModelProvider.notifier).fetchNews();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: newsState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : newsState.error != null
              ? Center(child: Text('Error: ${newsState.error}'))
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'News',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: Colors.grey[300],
                        thickness: 2,
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: newsState.newsList.map((entity) {
                            return Column(
                              children: [
                                _buildListTile(
                                  context: context,
                                  title: entity.title,
                                  description: entity.content ?? '',
                                  // imageUrl: entity.imageUrl ?? ''
                                  // Handle null imageUrl
                                ),
                                const SizedBox(height: 10),
                                Divider(
                                  indent: 16,
                                  endIndent: 16,
                                  color: Colors.grey[300],
                                  thickness: 2,
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }

  Widget _buildListTile({
    required BuildContext context,
    required String title,
    required String description,
    // String imageUrl,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Html(
                data: description, // Render HTML content here
                style: {
                  "p": Style(
                    fontSize: FontSize.medium,
                    lineHeight: LineHeight.number(1.5),
                  ),
                  "strong": Style(
                    fontWeight: FontWeight.bold,
                  ),
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(12.0),
        //   child: Container(
        //     width: 120,
        //     height: 80,
        //     color: Colors.grey[300],
        //     child: imageUrl.isNotEmpty
        //         ? Image.network(
        //             imageUrl,
        //             fit: BoxFit.cover,
        //           )
        //         : const Icon(
        //             Icons.image_not_supported), // Placeholder for missing image
        //   ),
        // ),
      ],
    );
  }
}
