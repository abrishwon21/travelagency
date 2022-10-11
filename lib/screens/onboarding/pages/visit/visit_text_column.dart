import 'package:flutter/material.dart';

import '../../widgets/text_column.dart';

class VisitTextColumn extends StatelessWidget {
  const VisitTextColumn();

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Visit',
      text:
          'Visit with us and learn an oldest history',
    );
  }
}
