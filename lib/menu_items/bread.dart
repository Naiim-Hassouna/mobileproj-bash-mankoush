import 'package:flutter/material.dart';
import '../widgets/common_widget.dart';
import '../menu.dart';

class QuantityWidget extends StatefulWidget {
  //get quantity {
  //return quantity;
  //}

  @override
  _QuantityWidgetState createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }


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


class Bread extends StatefulWidget {
  const Bread({super.key});

  @override
  _BreadState createState() => _BreadState();
}

class _BreadState extends State<Bread> {
  String selectedType="";
  //QuantityWidget quantityWidget = QuantityWidget();


  final Map<String, double> typeprices = {
    'Aarabe': 50,
    'Markouk': 75,
    'Asmar': 75,
    'Toast': 75,
    'Baguette': 75,
  };

  bool showButton = true;
  double finalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bread",
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
              child: Image.asset('assets/bread.jpg'),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuantityWidget(),  // Replace the existing Quantity row with QuantityWidget
                  const SizedBox(height: 10),
                  const Text(
                    "Type",
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RadioListTile(
                    title: const Text('Aarabe',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Aarabe',
                    groupValue: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Markouk',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Markouk',
                    groupValue: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Asmar',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Asmar',
                    groupValue: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Toast',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Toast',
                    groupValue: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Baguette',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Baguette',
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
              height: 20,
            ),
            if (showButton)
              GestureDetector(
                onTap: () {
                  setState(() {
                    finalPrice = typeprices[selectedType]!*1000;
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