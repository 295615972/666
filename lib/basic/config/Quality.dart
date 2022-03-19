/// 图片质量

import 'package:flutter/material.dart';
import '../Method.dart';

const _ImageQualityOriginal = "original";
const _ImageQualityLow = "low";
const _ImageQualityMedium = "medium";
const _ImageQualityHigh = "high";

const _LabelOriginal = "原图";
const _LabelLow = "低";
const _LabelMedium = "中";
const _LabelHigh = "高";

var _qualities = {
  _LabelOriginal: _ImageQualityOriginal,
  _LabelLow: _ImageQualityLow,
  _LabelMedium: _ImageQualityMedium,
  _LabelHigh: _ImageQualityHigh,
};

const _propertyName = "quality";
late String _currentQualityCode;
const _defaultValue = _ImageQualityOriginal;

Future<void> initQuality() async {
  _currentQualityCode = await method.loadProperty(_propertyName, _defaultValue);
}

String currentQualityCode() {
  return _currentQualityCode;
}

String currentQualityName() {
  for (var e in _qualities.entries) {
    if (e.value == _currentQualityCode) {
      return e.key;
    }
  }
  return '';
}

Future<void> chooseQuality(BuildContext context) async {
  String? code = await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text("请选择图片质量"),
        children: <Widget>[
          ..._qualities.entries.map(
            (e) => SimpleDialogOption(
              child: Text(e.key),
              onPressed: () {
                Navigator.of(context).pop(e.value);
              },
            ),
          ),
        ],
      );
    },
  );
  if (code != null) {
    method.saveProperty(_propertyName, code);
    _currentQualityCode = code;
  }
}

Widget qualitySetting() {
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      return ListTile(
        title: const Text("浏览时的图片质量"),
        subtitle: Text(currentQualityName()),
        onTap: () async {
          await chooseQuality(context);
          setState(() {});
        },
      );
    },
  );
}
