import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mad2_lab_ex_01/models/products.dart';

// ignore: must_be_immutable
class ManageProductsScreen extends StatelessWidget {
  ManageProductsScreen(
      {super.key,
      required this.screen,
      required this.add,
      required this.products,
      required this.index,
      required this.remove});

  var prodCodeCont = TextEditingController();
  var prodNameCont = TextEditingController();
  var prodPriceCont = TextEditingController();

  bool screen;
  final Function(Products p) add;
  final Function(Products p) remove;

  void edit() {
    remove(
      Products(
        prodCode: prodCodeCont.text,
        prodName: prodNameCont.text,
        prodPrice: double.parse(prodPriceCont.text),
      ),
    );
  }

  List<Products> products;
  int index;

  @override
  Widget build(BuildContext context) {
    if (!screen) {
      prodCodeCont.text = products[index].prodCode;
      prodNameCont.text = products[index].prodName;
      prodPriceCont.text = products[index].prodPrice.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title:
            screen ? const Text('Add a Product') : const Text('Edit a Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            screen
                ? TextField(
                    controller: prodCodeCont,
                    decoration: const InputDecoration(
                      label: Text('Product Code'),
                      border: OutlineInputBorder(),
                    ),
                  )
                : TextField(
                    readOnly: true,
                    controller: prodCodeCont,
                    decoration: const InputDecoration(
                      label: Text('Product Code'),
                      border: OutlineInputBorder(),
                    ),
                  ),
            const Gap(12),
            TextField(
              controller: prodNameCont,
              decoration: const InputDecoration(
                label: Text('Product Name/Desc'),
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(12),
            TextField(
              controller: prodPriceCont,
              decoration: const InputDecoration(
                label: Text('Price'),
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(12),
            ElevatedButton(
              onPressed: () {
                add(
                  Products(
                    prodCode: prodCodeCont.text,
                    prodName: prodNameCont.text,
                    prodPrice: double.parse(prodPriceCont.text),
                  ),
                );
                Navigator.of(context).pop();
              },
              child: screen ? const Text('Add') : const Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
