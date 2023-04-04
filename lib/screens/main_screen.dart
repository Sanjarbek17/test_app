import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

import '../models/main_model.dart';
import '../providers/main_screen_provider.dart';

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
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.calendar_today),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.segment),
                      )
                    ],
                  ),
                  Expanded(child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                        products[index % products.length].name),
                                    Text(products[index % products.length]
                                        .address),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.shopping_cart_outlined))
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ))
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
