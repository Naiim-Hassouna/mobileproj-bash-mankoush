import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 205, 120, 100),
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset('assets/home_logo.png'),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Bash\nMankoush",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.brown,
            fontSize: 45,
            fontWeight: FontWeight.bold,

          ),
        ),
        const SizedBox(
          height: 80,
        ),
        GestureDetector(
          onTap: (() => Navigator.of(context).pushNamed("/menu")),
          child: Container(
            height: 60,
            width: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.brown),
            child: const Center(
              child: Text(
                "Order Now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
