import 'package:flutter/material.dart';

var cartItem = [];
int totalPrice = 0;

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30,
          ),
        ),
        title: Text(
          "Order List",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
            onTap: () {
              cartItem = [];
              totalPrice = 0;
              setState(
                () {},
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.delete_forever,
                size: 35,
              ),
            ),
          )
        ],
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: cartItem.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          image: AssetImage(cartItem[index]["image"]),
                          height: 45),
                      Text(
                        cartItem[index]['name'],
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text("X ${cartItem[index]['order count']}",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Divider(
                  height: 10,
                  thickness: 1.3,
                )
              ],
            );
          }),
      bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Total Amount:\n Rs.${totalPrice}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 80),
                  backgroundColor: Color(0xFFFFCC98),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  cartItem.isNotEmpty
                      ? showConfirmDialog(context)
                      : showAlertDialog(context);
                },
                child: Text(
                  "Place Order",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50),
                  backgroundColor: Color(0xFFFFCC98),
                ),
              )
            ],
          )),
    );
  }

  showConfirmDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: (Text(
        "Your order is on the way...",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
      content: Image(
        image: AssetImage("assets/images/cycling.gif"),
        height: 100,
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: (Text(
        "Please add items first",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
