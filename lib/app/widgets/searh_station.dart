import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchStation extends StatelessWidget {
  const SearchStation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder =
        OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
    return const Card(
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Search Station",
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.filter_list),
          enabledBorder: outlineInputBorder,
          border: outlineInputBorder,
          focusedBorder: outlineInputBorder,
        ),
      ),
    );
  }
}
