import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:test_app/style/main_style.dart';

import '../models/main_model.dart';
import '../providers/main_screen_provider.dart';
import '../style/constant.dart';
import '../widgets/main_widgets.dart';
import '../icons/custom_icons.dart';
import 'widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, myProvider, child) {
        // all products
        List<Product> products = myProvider.products;

        // Todays date
        initializeDateFormatting('ru_RU');
        DateTime now = DateTime.now();
        String formattedDate = DateFormat("Сегодня, dd MMMM", "ru_RU").format(now);

        return MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
                child: Column(
                  children: [
                    // text, how many vised and date
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // visted client count
                            Text(
                              '${products.length} визитов',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 4),
                            // todays date
                            Text(formattedDate, style: Theme.of(context).textTheme.titleSmall),
                          ],
                        )
                      ],
                    ),
                    // navbar, switcher and icons
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButtons(icon: CustomIcons.calendar, onTap: () {}),
                          // Switcher
                          const Switcher(),
                          IconButtons(icon: CustomIcons.sort, onTap: () {})
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return CustomCard(product: products[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              // elevation: 1.0,
              unselectedItemColor: black,
              selectedItemColor: dodgerBlue,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.timeline_outlined,
                    ),
                    label: 'Визиты'),
                BottomNavigationBarItem(icon: Icon(Icons.settings_input_svideo), label: 'Команда'),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Профиль'),
              ],
              currentIndex: Provider.of<BottomNavigationBarProvider>(context).currentIndex,
              onTap: (index) {
                Provider.of<BottomNavigationBarProvider>(context, listen: false).changeIndex(index);
              },
            ),
          ),
        );
      },
    );
  }
}
