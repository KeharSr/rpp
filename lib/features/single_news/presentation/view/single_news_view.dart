import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpp/features/notice/domain/entity/news_entity.dart';

class SingleNewsView extends ConsumerWidget {
  final NewsEntity news;

  const SingleNewsView({super.key, required this.news});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RPP News updates #${news.id}', // Make the title dynamic
          style: GoogleFonts.playfairDisplay(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date and Time Row
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Colors.deepPurple,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'August 16, 2024', // You can also make the date dynamic
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.access_time,
                  color: Colors.deepPurple,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  '12:30 PM', // Make time dynamic if available in data
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Divider
            const Divider(
              thickness: 2,
              color: Colors.grey,
            ),

            const SizedBox(height: 16),

            // Large Image Section
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  '${news.imageUrl}', // Make sure to use a valid image URL
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported, size: 50),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Description Section
            Expanded(
              child: SingleChildScrollView(
                child: Html(
                  data: news.content ?? 'No description available.',
                  style: {
                    'body': Style(
                      fontSize: FontSize(16),
                      color: Colors.black87,
                    ),
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
