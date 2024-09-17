import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProgramView extends ConsumerStatefulWidget {
  const ProgramView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProgramViewState();
}

class _ProgramViewState extends ConsumerState<ProgramView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
