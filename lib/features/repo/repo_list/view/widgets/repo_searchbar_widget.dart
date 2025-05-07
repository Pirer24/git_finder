import 'package:flutter/material.dart';

class RepoSearchbarWidget extends StatelessWidget {
  final bool enabled;
  final Function(String) onSubmitted;
  final TextEditingController? controller;

  const RepoSearchbarWidget({
    required this.onSubmitted,
    this.enabled = true,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      enabled: enabled,
      onSubmitted: onSubmitted,
    );
  }
}
