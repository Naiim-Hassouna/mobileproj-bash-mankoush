import 'package:flutter/material.dart';
import 'home.dart';
import 'menu.dart';
import 'menu_items/mankoushe.dart';
import 'menu_items/pizza.dart';
import 'menu_items/croissant.dart';
import 'menu_items/donut.dart';
import 'menu_items/bread.dart';



void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
    "/": (context) => Home(),
    "/menu": ((context) => Menu()),
    "/menu_items/mankoushe": (context) => Mankoushe(),
    "/menu_items/pizza": (context) => Pizza(),
    "/menu_items/croissant": (context) => Croissant(),
    "/menu_items/donut": (context) => Donut(),
    "/menu_items/bread": (context) => Bread(),
  },
));
