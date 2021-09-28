import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///my program will takes all this providers as child
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        /// ottengo dati sulle modifiche al mio carrello
        /// e posso ascoltare le modifiche ovunque nel sistema
        create: (ctx) => Cart(),
      ),
      ChangeNotifierProvider(
        ///ottengo dati sulle modifiche relative ai miei prodotti
        create: (ctx) => Products(),
        child: MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato',
            ),
            home: ProductsOverviewScreen(),
            routes: {
              ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            }),
      )
    ]);
  }
}
