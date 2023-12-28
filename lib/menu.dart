import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<String> menuItems = [];
  List<String> menuPics = [];

  @override
  void initState() {
    super.initState();
    // Fetch categories from the database when the widget is created
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final response = await http.get(Uri.parse('https://bash-mankoush.000webhostapp.com/fetch_categories.php'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      // Extract category names and image URLs from the response
      for (var category in data) {
        menuItems.add(category['name']);
        menuPics.add(category['img']);
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
      body: content(),
    );
  }

  Widget content() {
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
              ],
            ),
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
                leading: Image.network(menuPics[index]), // Use Image.network for fetching images from the network
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
                    String pageRoute = '/menu_items/${menuItems[index].toLowerCase()}';

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
          }),
        ),
      ],
    );
  }
}
