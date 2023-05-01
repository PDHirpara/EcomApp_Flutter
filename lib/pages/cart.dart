import 'package:e_commerce_app/product/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    AddedProducts.forEach((element) {
      totalPrice += element.price;
    });
  }

  int totalPrice = 0;
  TextStyle style = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart Page",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.of(context).pop('DetailPage');
          },
        ),
      ),
      body: Column(
        children: [
          (AddedProducts.isNotEmpty)
              ? Expanded(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: AddedProducts.map(
                        (e) => Container(
                          margin: const EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(blurRadius: 10, color: Colors.grey),
                              ]),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width * 0.37,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.red,
                                  image: DecorationImage(
                                      image: NetworkImage(e.thumbnail),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.title,
                                    style: style,
                                  ),
                                  Text(
                                    "\$ ${e.price.toString()}",
                                    style: style,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        AddedProducts.forEach((element) {
                                          totalPrice -= element.price;
                                        });
                                        AddedProducts.remove(e);
                                      });
                                    },
                                    child: const Text(
                                      "DELETE",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ).toList(),
                    ),
                  ),
                )
              : Expanded(
                  flex: 8,
                  child: Center(
                    child: Text(
                      "cart is empty.....",
                      style: style,
                    ),
                  ),
                ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Text(
                      "Total Price:",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$ $totalPrice",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
