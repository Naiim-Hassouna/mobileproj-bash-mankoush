import 'package:flutter/material.dart';
import '../widgets/common_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class Croissant extends StatefulWidget {
  const Croissant({super.key});

  @override
  _CroissantState createState() => _CroissantState();
}

class _CroissantState extends State<Croissant> {
  String selectedType = "";
  int quantity = 1;


  List<Map<String, dynamic>> items = [];

  double finalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    // Fetch items from the database when the widget is created
    fetchItems();
  }

  Future<void> fetchItems() async {
    final response = await http.get(Uri.parse('https://bash-mankoush.000webhostapp.com/fetch_croissant.php'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      // Extract item names and prices from the response
      for (var item in data) {
        items.add({
          'name': item['name'],
          'price': item['price'],
        });
      }

      // Update the state to trigger a rebuild with the fetched data
      setState(() {});
    } else {
      // Handle server error
      print('Server error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Croissant",
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
            child: Image.asset('assets/croissant.png'),
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
                  "Type",
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Use the fetched items to dynamically generate RadioListTile widgets
                for (var item in items)
                  RadioListTile(
                    title: Text(
                      item['name'],
                      style: const TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: item['name'],
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
                final selectedPrice = int.parse(items.firstWhere((item) => item['name'] == selectedType)['price']);
                // Calculate the final price
                finalPrice = selectedPrice * quantity * 1000;

                showSnackbar(context,
                    "Order Confirmed.\nYour Order: ${quantity}x Croissant $selectedType.\nThe final price is: $finalPrice LBP.\nOrder will be ready soon.");
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
        duration: const Duration(seconds: 7), // duration for snackbar
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // border radius
        ),
      ),
    );
  }
}
