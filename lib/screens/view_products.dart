import 'package:flutter/material.dart';
import 'package:mad2_lab_ex_01/models/products.dart';
import 'package:mad2_lab_ex_01/screens/manage_products.dart';

class ViewProductsScreen extends StatefulWidget {
  ViewProductsScreen({super.key});

  @override
  State<ViewProductsScreen> createState() => _ViewProductsScreenState();
}

class _ViewProductsScreenState extends State<ViewProductsScreen> {
  bool screen = true;
  int index = 0;
  List<Products> listProducts = [];

  void addProduct(Products p) {
    setState(() {
      listProducts.add(p);
    });
  }

  void clear(Products p) {
    setState(() {
      listProducts.remove(p);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Products'),
        actions: [
          IconButton(
            onPressed: () {
              screen;
              index;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ManageProductsScreen(
                    screen: screen,
                    add: addProduct,
                    products: listProducts,
                    index: index,
                    remove: clear,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: listProducts.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
              child: ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.star),
                ),
                title: Text(
                  listProducts[index].prodName,
                ),
              ),
            ),
            onTap: () {
              screen = false;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ManageProductsScreen(
                      screen: screen,
                      add: addProduct,
                      products: listProducts,
                      index: index,
                      remove: clear),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
