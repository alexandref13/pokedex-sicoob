import 'package:flutter/material.dart';
import 'package:pokedex_sicoob/core/extensions/navigation_extensions.dart';

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        title: Text("Sentimos muito"),
        content: Text(
          "Atualmente, só é possível buscar Pokémons utilizando o nome exato!",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Ok'),
          ),
        ],
      );
    },
  );
}
