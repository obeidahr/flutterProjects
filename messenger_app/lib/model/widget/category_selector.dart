import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selected = 0;
  List<String> category = ['Message', 'online', 'Groups', 'Requests'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (BuildContext c, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                     selected = index;                 
                  });
                },
                child: Text(
                  category[index],
                  style: TextStyle(
                    fontSize: 28,
                    color: index == selected ? Color(0x55CFDBDC) : Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
