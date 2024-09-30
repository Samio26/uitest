import 'package:flutter/material.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(10), 
        
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: "Search for an event", 
            hintStyle:  TextStyle(color: Colors.grey), 
            border: InputBorder.none, 
            icon: Icon(Icons.search, color: Colors.grey,size: 30,), 
          ),
        ),
      );
    
  }
}
