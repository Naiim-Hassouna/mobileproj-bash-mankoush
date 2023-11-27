import 'package:flutter/material.dart';
import 'details.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> menuItems = [
      "Mankoushe",
      "Pizza",
      "Croissant",
      "Donut",
      "Bread",
    ];
    List<String> menuPics = [
      'assets/manoushe.png',
      'assets/pizza.jpg',
      'assets/croissant.png',
      'assets/donut.png',
      'assets/bread.jpg',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MENU",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 40,
          ),
        ),
        backgroundColor: const Color.fromRGBO(247, 205, 120, 100),
        toolbarHeight: 100,
        elevation: 0,
          actions: [
      Padding(
        padding: const EdgeInsets.only(right: 0.0),
          child: Image.asset(
              'assets/home_logo_flipped.png',
              width: 100,
              height: 110,
            ),
          )
      ],
      ),
      body: content(menuItems,menuPics),
    );
  }

  Widget content(List<String> menuItems, List<String> menuPics) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text.rich(
            TextSpan(
                text: "Where Flour\n",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.brown[900],

                ),
                children: const [
                  TextSpan(
                    text: "Meets Passion.",
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.builder(
            itemCount: menuItems.length,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: ListTile(
                  leading: Image.asset(menuPics[index]),
                  title: Text(
                    menuItems[index],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      // Determine the page to navigate based on the item index
                      String pageRoute;
                      switch (index) {
                        case 0:
                          pageRoute = '/menu_items/mankoushe';
                          break;
                        case 1:
                          pageRoute = '/menu_items/pizza';
                          break;
                        case 2:
                          pageRoute = '/menu_items/croissant';
                          break;
                        case 3:
                          pageRoute = '/menu_items/donut';
                          break;
                        case 4:
                          pageRoute = '/menu_items/bread';
                          break;
                        default:
                        // Navigate to a default page if index is out of range
                          pageRoute = '/menu';
                          break;
                      }
                      // Navigate to the determined page
                      Navigator.of(context).pushNamed(pageRoute);
                    },
                      child: const Icon(
                      Icons.keyboard_arrow_right,
                      size: 30,
                    ),
                  ),
                ),
              );
            }))
      ],
    );
  }
}