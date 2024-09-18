import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpp/features/notice/widgets/news_view.dart';

class NoticeView extends ConsumerWidget {
  const NoticeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notice'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Press'),
              Tab(text: 'Notice'), // Tab 1: Notice
              Tab(text: 'News'), // Tab 2: News
              // Tab 3: Press
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Press Content')),
            Center(child: Text('Notice Content')), // Content for Notice Tab
            Center(child: NewsView()), // Content for News Tab
          ],
        ),
      ),
    );
  }
}
