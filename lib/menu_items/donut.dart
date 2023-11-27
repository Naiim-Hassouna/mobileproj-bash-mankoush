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



class Donut extends StatefulWidget {
  const Donut({super.key});

  @override
  _DonutState createState() => _DonutState();
}

class _DonutState extends State<Donut> {
  String selectedSize="";
  String selectedType="";
  //QuantityWidget quantityWidget = QuantityWidget();


  final Map<String, double> sizeprices = {
    'Not Filled': 1,
    'Filled': 1.5,
  };
  final Map<String, double> typeprices = {
    'Standard': 50,
    'Chocolate': 100,
    'Rainbow Sprinkles': 150,
    'Frosted Strawberry': 150,
  };

  bool showButton = true;
  double finalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Donut",
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
              child: Image.asset('assets/donut.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  QuantityWidget(),  
                  const Text(
                    "Filling",
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RadioListTile(
                    title: const Text('No',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Not Filled',
                    groupValue: selectedSize,
                    onChanged: (value) {
                      setState(() {
                        selectedSize = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Yes',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Filled',
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
                    title: const Text('Standard',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Standard',
                    groupValue: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Chocolate',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Chocolate',
                    groupValue: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Rainbow Sprinkles',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Rainbow Sprinkles',
                    groupValue: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),RadioListTile(
                    title: const Text('Frosted Strawberry',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'Frosted Strawberry',
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