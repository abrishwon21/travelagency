import 'package:flutter/material.dart';

import '../../../../constants.dart';

class VisitDarkCardContent extends StatelessWidget {
  const VisitDarkCardContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Icon(
              Icons.church,
              color: kWhite,
              size: 32.0,
            ),
          ],
        ),
        const SizedBox(height: kSpaceM),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Icon(
              Icons.mosque,
              color: kWhite,
              size: 32.0,
            ),
            Icon(
              Icons.library_books,
              color: kWhite,
              size: 32.0,
            ),
            Icon(
              Icons.museum,
              color: kWhite,
              size: 32.0,
            ),
          ],
        ),
      ],
    );
  }
}
