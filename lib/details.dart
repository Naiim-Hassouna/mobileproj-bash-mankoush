import 'package:flutter/material.dart';
import 'widgets/common_widget.dart';
import 'menu.dart';

class Details extends StatelessWidget {
  const Details({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "selectedItem",
          style: TextStyle(color: Colors.brown, fontSize: 30),
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
            height: 200,
            color: Colors.brown[50],
            child: Image.asset('assets/coffee_cup.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Latte",
                      style: TextStyle(fontSize: 20, color: Colors.brown),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.remove),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                        Icon(Icons.add)
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Size",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: Image.asset('assets/bakerylogo.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/bakerylogo.png'),
                    ),
                  ],
                ),



              ],
            ),
          ),

          GestureDetector(
              onTap: (() => Navigator.of(context).pushNamed("/summary")),
              child: submitButton("Add to cart"))
        ],
      ),
    );
  }
}
