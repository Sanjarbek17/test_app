import 'package:flutter/material.dart';

import '../../icons/custom_icons.dart';
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
                        ? const Icon(CustomIcons.buy, color: lavender)
                        : const Icon(
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
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          boxShadow: const [
            // innter top shadow
            BoxShadow(color: black, blurRadius: 60, blurStyle: BlurStyle.inner),
            BoxShadow(offset: Offset(0, 0.6), color: concrete2, spreadRadius: 0.1, blurRadius: 1.5, blurStyle: BlurStyle.inner),
          ],
          borderRadius: BorderRadius.circular(13),
          color: Colors.transparent,
        ),
        width: 192,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  onTap(0);
                },
                style: selectedIndex != 0
                    ? ButtonStyle(
                        //shadow to null
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all<Color>(concrete2),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      )
                    : ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                child: Text(
                  'Списком',
                  style: selectedIndex == 0 ? const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400) : const TextStyle(color: grey, fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  onTap(1);
                },
                style: selectedIndex != 1
                    ? ButtonStyle(
                        //shadow to null
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all<Color>(concrete2),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      )
                    : ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                child: Text(
                  'На карте',
                  style: selectedIndex == 1 ? const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400) : const TextStyle(color: grey, fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ));
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
