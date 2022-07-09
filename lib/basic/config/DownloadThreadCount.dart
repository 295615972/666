/// 多线程下载并发数

import 'package:flutter/material.dart';
import 'package:pikapika/basic/Common.dart';
import 'package:pikapika/basic/Method.dart';

import 'IsPro.dart';

late int _downloadThreadCount;
const _values = [1, 2, 3, 4, 5];

Future initDownloadThreadCount() async {
  _downloadThreadCount = await method.loadDownloadThreadCount();
}

Widget downloadThreadCountSetting() {
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      return ListTile(
        title: Text(
          "下载线程数" + (!isPro ? "(发电)" : ""),
          style: TextStyle(
            color: !isPro ? Colors.grey : null,
          ),
        ),
        subtitle: Text("$_downloadThreadCount"),
        onTap: () async {
          if (!isPro) {
            defaultToast(context, "请先发电再使用");
            return;
          }
          int? value = await chooseListDialog(context, "选择下载线程数", _values);
          if (value != null) {
            await method.saveDownloadThreadCount(value);
            _downloadThreadCount = value;
            setState(() {});
          }
        },
      );
    },
  );
}
