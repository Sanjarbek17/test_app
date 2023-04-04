import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:test_app/style/main_style.dart';

import '../models/main_model.dart';
import '../providers/main_screen_provider.dart';
import '../style/constant.dart';

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
        String formattedDate =
            DateFormat("Сегодня, dd MMMM", "ru_RU").format(now);

        return MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
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
                            Text(formattedDate,
                                style: Theme.of(context).textTheme.titleSmall),
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
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.calendar_today, color: dodgerBlue),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.segment, color: dodgerBlue),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          products[index % products.length]
                                              .name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          products[index % products.length]
                                              .address,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                    // store type icons
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: products[index % products.length]
                                                    .storeType ==
                                                'buy'
                                            ? bilobaFlower
                                            : mossGreen,
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon:
                                              products[index % products.length]
                                                          .storeType ==
                                                      'buy'
                                                  ? Icon(
                                                      Icons
                                                          .shopping_cart_outlined,
                                                      color: lavender,
                                                    )
                                                  : Icon(
                                                      Icons.card_travel,
                                                      color: deYork,
                                                    ),
                                          iconSize: 20.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                // product time and distance
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Text(
                                          '🕔 ${products[index % products.length].time.toString()} мин',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                      const SizedBox(width: 30),
                                      Text(
                                        '🌴 ${products[index % products.length].distance.toString()} км',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ]),
                                    Text(products[index % products.length].code,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall)
                                  ],
                                )
                              ],
                            ),
                          );
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
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings_input_svideo), label: 'Команда'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined),
                    label: 'Профиль'),
              ],
              currentIndex: 0,
              onTap: (index) {},
            ),
          ),
        );
      },
    );
  }
}
