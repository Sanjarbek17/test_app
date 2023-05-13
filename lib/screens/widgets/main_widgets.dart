import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:provider/provider.dart';

import '../../icons/custom_icons.dart';
import '../../providers/main_screen_provider.dart';
import '../../style/constant.dart';

import '../../models/main_model.dart';

class CustomButtomNavigation extends StatelessWidget {
  const CustomButtomNavigation({super.key, required this.selectedIndex, required this.onTap});

  final int selectedIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            // top shadow
            BoxShadow(
              color: Color.fromARGB(255, 205, 202, 202),
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(19),
            topRight: Radius.circular(19),
          )),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        InkWell(
          onTap: () {
            onTap(0);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(NavIcons.route, color: selectedIndex == 0 ? dodgerBlue : black),
              Text('Визиты', style: TextStyle(color: selectedIndex == 0 ? dodgerBlue : black)),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            onTap(1);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                NavIcons.comanda,
                color: selectedIndex == 1 ? dodgerBlue : black,
                size: 25,
              ),
              Text('Команда', style: TextStyle(color: selectedIndex == 1 ? dodgerBlue : black)),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            onTap(2);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle_outlined, color: selectedIndex == 2 ? dodgerBlue : black),
              Text('Профиль', style: TextStyle(color: selectedIndex == 2 ? dodgerBlue : black)),
            ],
          ),
        ),
      ]),
    );
  }
}

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
      isShadowEnable: false,
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
