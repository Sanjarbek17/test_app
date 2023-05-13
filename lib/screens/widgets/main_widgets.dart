import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:provider/provider.dart';

import '../../icons/custom_icons.dart';
import '../../providers/main_screen_provider.dart';
import '../../style/constant.dart';

import '../../models/main_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // product name and address
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.address,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              // store type icons
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: product.storeType == 'buy' ? bilobaFlower : mossGreen,
                ),
                child: Center(
                    child: product.storeType == 'buy'
                        ? Icon(CustomIcons.buy, color: lavender)
                        : Icon(
                            CustomIcons.work,
                            color: deYork,
                          )),
              )
            ],
          ),
          // product time and distance
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Row(
                  children: [
                    const Icon(CustomIcons.time, size: 18),
                    Text(' ${product.time.toString()} мин', style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                const SizedBox(width: 30),
                Row(
                  children: [
                    const Icon(CustomIcons.route, size: 18),
                    Text(
                      ' ${product.distance.toString()} км',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ]),
              Text(product.code, style: Theme.of(context).textTheme.bodySmall)
            ],
          )
        ],
      ),
    );
  }
}

class Switcher extends StatelessWidget {
  const Switcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterToggleTab(
      marginSelected: const EdgeInsets.all(3),
      width: MediaQuery.of(context).size.width * 0.13,
      height: 40,
      borderRadius: 10,
      selectedIndex: Provider.of<SwitcherProvider>(context).currentIndex,
      selectedBackgroundColors: const [Colors.white],
      unSelectedBackgroundColors: [greyBackground],
      selectedTextStyle: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
      unSelectedTextStyle: TextStyle(color: grey, fontSize: 14, fontWeight: FontWeight.w400),
      labels: const ['Списком', 'На карте'],
      selectedLabelIndex: (index) {
        Provider.of<SwitcherProvider>(context, listen: false).changeIndex(index);
      },
    );
  }
}

class IconButtons extends StatelessWidget {
  /// IconButtons for main screen appbar
  final IconData icon;
  final void Function()? onTap;

  const IconButtons({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white),
      child: IconButton(onPressed: onTap, icon: Icon(icon, color: dodgerBlue)),
    );
  }
}
