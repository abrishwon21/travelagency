import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../widgets/icon_container.dart';

class VisitLightCardContent extends StatelessWidget {
  const VisitLightCardContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        IconContainer(
          icon: Icons.history_edu,
          padding: kPaddingS,
        ),
        IconContainer(
          icon: Icons.hiking_rounded,
          padding: kPaddingM,
        ),
        IconContainer(
          icon: Icons.camera,
          padding: kPaddingS,
        ),
      ],
    );
  }
}
