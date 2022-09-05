import 'package:flutter/material.dart';
import 'package:pikapika/basic/Common.dart';
import 'package:pikapika/basic/config/Version.dart';
import 'package:pikapika/screens/AboutScreen.dart';
import 'package:pikapika/screens/AccountScreen.dart';
import 'package:pikapika/screens/DownloadListScreen.dart';
import 'package:pikapika/screens/FavouritePaperScreen.dart';
import 'package:pikapika/screens/ProScreen.dart';
import 'package:pikapika/screens/ThemeScreen.dart';
import 'package:pikapika/screens/ViewLogsScreen.dart';
import 'package:pikapika/basic/Method.dart';

import '../basic/config/IsPro.dart';
import '../basic/config/Themes.dart';
import 'SettingsScreen.dart';
import 'components/Badge.dart';
import 'components/UserProfileCard.dart';

// 个人空间页面
class SpaceScreen extends StatefulWidget {
  const SpaceScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SpaceScreenState();
}

class _SpaceScreenState extends State<SpaceScreen> {
  @override
  void initState() {
    versionEvent.subscribe(_onEvent);
    proEvent.subscribe(_onEvent);
    super.initState();
  }

  @override
  void dispose() {
    versionEvent.unsubscribe(_onEvent);
    proEvent.unsubscribe(_onEvent);
    super.dispose();
  }

  void _onEvent(dynamic a) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
        actions: [
          IconButton(
            onPressed: () async {
              bool result =
                  await confirmDialog(context, '退出登录', '您确认要退出当前账号吗?');
              if (result) {
                await method.clearToken();
                await method.setPassword("");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()),
                );
              }
            },
            icon: const Icon(Icons.exit_to_app),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
            icon: Badged(
              child: const Icon(Icons.info_outline),
              badge: latestVersion() == null ? null : "1",
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const ProScreen();
              }));
            },
            icon: Icon(
              isPro ? Icons.offline_bolt : Icons.offline_bolt_outlined,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(
        children: [
          const Divider(),
          const UserProfileCard(),
          const Divider(),
          ListTile(
            onTap: () async {
              if (androidNightModeDisplay) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThemeScreen()),
                );
              } else {
                chooseLightTheme(context);
              }
            },
            title: const Text('主题'),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavouritePaperScreen()),
              );
            },
            title: const Text('我的收藏'),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ViewLogsScreen()),
              );
            },
            title: const Text('浏览记录'),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DownloadListScreen()),
              );
            },
            title: const Text('我的下载'),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProScreen()),
              );
            },
            title: const Text('发电'),
          ),
          const Divider(),
          ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
              title: Badged(
                child: const Text('关于'),
                badge: latestVersion() == null ? null : "1",
              )),
          const Divider(),
        ],
      ),
    );
  }
}
