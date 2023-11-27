import 'package:flutter/material.dart';
import '../widgets/common_widget.dart';
import '../menu.dart';

class QuantityWidget extends StatefulWidget {
  final int initialQuantity;
  final Function(int) onQuantityChanged;

  QuantityWidget({required this.initialQuantity, required this.onQuantityChanged});

  @override
  _QuantityWidgetState createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
      widget.onQuantityChanged(quantity);
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
        widget.onQuantityChanged(quantity);
      }
    });
  }

  int get getquantity => quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Quantity",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            GestureDetector(
              onTap: decreaseQuantity,
              child: const Icon(Icons.remove),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                quantity.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.brown,
                ),
              ),
            ),
            GestureDetector(
              onTap: increaseQuantity,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}

class Mankoushe extends StatefulWidget {
  const Mankoushe({Key? key}) : super(key: key);

  @override
  _MankousheState createState() => _MankousheState();
}

class _MankousheState extends State<Mankoushe> {
  String selectedSize = "";
  String selectedType = "";
  int quantity = 1;

  final Map<String, double> sizePrices = {
    'Medium': 1,
    'Large': 1.5,
  };

  final Map<String, double> typePrices = {
    'Zaatar': 50,
    'Jebne': 150,
    'Keshek': 175,
    'Lahme': 200,
  };

  double finalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mankoushe",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(247, 205, 120, 100),
        toolbarHeight: 100,
        elevation: 0,
      ),
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.brown[50],
            child: Image.asset('assets/manoushe.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuantityWidget(
                  initialQuantity: 1,
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      quantity = newQuantity;
                    });
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  "Size",
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RadioListTile(
                  title: const Text(
                    'Medium',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: 'Medium',
                  groupValue: selectedSize,
                  onChanged: (value) {
                    setState(() {
                      selectedSize = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text(
                    'Large',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: 'Large',
                  groupValue: selectedSize,
                  onChanged: (value) {
                    setState(() {
                      selectedSize = value.toString();
                    });
                  },
                ),
                const Text(
                  "Type",
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RadioListTile(
                  title: const Text(
                    'Zaatar',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: 'Zaatar',
                  groupValue: selectedType,
                  onChanged: (value) {
                    setState(() {
                      selectedType = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text(
                    'Jebne',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: 'Jebne',
                  groupValue: selectedType,
                  onChanged: (value) {
                    setState(() {
                      selectedType = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text(
                    'Keshek',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: 'Keshek',
                  groupValue: selectedType,
                  onChanged: (value) {
                    setState(() {
                      selectedType = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text(
                    'Lahme',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: 'Lahme',
                  groupValue: selectedType,
                  onChanged: (value) {
                    setState(() {
                      selectedType = value.toString();
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
            GestureDetector(
              onTap: () {
                setState(() {
                  finalPrice = sizePrices[selectedSize]! *
                      typePrices[selectedType]! *
                      1000 *
                      quantity;
                  showSnackbar(context, "Order Confirmed.\nYour Order: ${quantity}x $selectedSize Mankoushe $selectedType.\nThe final price is: $finalPrice LBP.\nOrder will be ready soon.");
                });
              },
              child: submitButton("Made Your Mind?"),
            ),
        ],
      ),
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green, // background color
        duration: const Duration(seconds: 7),// duration for snackbar
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // border radius
        ),
      ),
    );
  }
}