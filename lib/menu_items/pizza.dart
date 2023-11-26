import 'package:flutter/material.dart';
import '../widgets/common_widget.dart';
import '../menu.dart';


class Pizza extends StatefulWidget {
  const Pizza({super.key});

  @override
  _PizzaState createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  String selectedSize="";
  String selectedType="";
  //QuantityWidget quantityWidget = QuantityWidget();


  final Map<String, double> sizeprices = {
    'Small':0.8,
    'Medium': 1,
    'Large': 1.5,
  };
  final Map<String, double> typeprices = {
    'Margherita': 100,
    'Pepperoni': 100,
    'BBQ Chicken Pizza': 200,
    'Cheese': 150,
  };

  bool showButton = true;
  double finalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pizza",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 30,
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
              child: Image.asset('assets/pizza.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    title: const Text('Small',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Small',
                    groupValue: selectedSize,
                    onChanged: (value) {
                      setState(() {
                        selectedSize = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Medium',
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
                        selectedSize = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Large',
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
                        selectedSize = value!;
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
                    title: const Text('Margherita',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Margherita',
                    groupValue: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Pepperoni',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Pepperoni',
                    groupValue: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('BBQ Chicken Pizza',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'BBQ Chicken Pizza',
                    groupValue: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),RadioListTile(
                    title: const Text('Cheese',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Cheese',
                    groupValue: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (showButton)
              GestureDetector(
                onTap: () {
                  setState(() {
                    finalPrice = sizeprices[selectedSize]! * typeprices[selectedType]!*1000;
                    showButton = false;
                  });
                },
                child: submitButton("Made Your Mind?"),
              ),
            if (!showButton)
              Text(
                "The final price is: $finalPrice LBP",
                style: const TextStyle(
                  color: Colors.brown,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ));
  }
}