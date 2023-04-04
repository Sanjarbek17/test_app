import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:provider/provider.dart';

import '../providers/main_screen_provider.dart';
import '../style/constant.dart';

class Switcher extends StatelessWidget {
  const Switcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterToggleTab(
      width: MediaQuery.of(context).size.width * 0.13,
      height: 35,
      borderRadius: 10,
      selectedIndex: Provider.of<SwitcherProvider>(context).currentIndex,
      selectedBackgroundColors: const [Colors.white],
      unSelectedBackgroundColors: [greyBackground],
      selectedTextStyle: const TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
      unSelectedTextStyle:
          TextStyle(color: grey, fontSize: 14, fontWeight: FontWeight.w400),
      labels: const ['Списком', 'На карте'],
      selectedLabelIndex: (index) {
        Provider.of<SwitcherProvider>(context, listen: false)
            .changeIndex(index);
      },
    );
  }
}
