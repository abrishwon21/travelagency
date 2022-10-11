import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../widgets/icon_container.dart';

class TransportLightCardContent extends StatelessWidget {
  const TransportLightCardContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        IconContainer(
          icon: Icons.travel_explore_outlined,
          padding: kPaddingS,
        ),
        IconContainer(
          icon: Icons.car_rental,
          padding: kPaddingM,
        ),
        IconContainer(
          icon: Icons.train_rounded,
          padding: kPaddingS,
        ),
      ],
    );
  }
}
