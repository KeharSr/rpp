import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OthersView extends ConsumerStatefulWidget {
  const OthersView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OthersViewState();
}

class _OthersViewState extends ConsumerState<OthersView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
