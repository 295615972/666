import 'package:flutter/material.dart';
import 'package:pikapika/basic/Navigator.dart';

import '../ComicInfoScreen.dart';

class LinkToComicInfo extends StatelessWidget {
  final String comicId;
  final Widget child;

  const LinkToComicInfo({
    required this.comicId,
    required this.child,
    Key? key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          navPushOrReplace(
            context,
            (context) => ComicInfoScreen(comicId: comicId),
          );
        },
        child: child,
      );
}
