import 'package:flutter/material.dart';

import '../../widgets/text_column.dart';

class TransportTextColumn extends StatelessWidget {
  const TransportTextColumn();

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Keep Travelling',
      text: 'Travel with us and visit an Ethiopian historic places',
    );
  }
}
