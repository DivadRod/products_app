import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:products_app/models/models.dart';
import 'package:http/http.dart' as http;

class ItemToolsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-learning-bdc2e-default-rtdb.firebaseio.com';
  final List<ToolsItem> toolsItems = [];
  bool isLoading = true;

  ItemToolsService() {
    this.loadItemTools();
  }

  // TODO: hacer fetcjh productos
  Future<List<ToolsItem>> loadItemTools() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final respuesta = await http.get(url);
    final Map<String, dynamic> toolsItemsMap = json.decode(respuesta.body);

    toolsItemsMap.forEach((key, value) {
      final temporalItemTool = ToolsItem.fromMap(value);
      temporalItemTool.id = key;
      toolsItems.add(temporalItemTool as ToolsItem);
    });

    //print(toolsItems[1].name);
    isLoading = false;
    notifyListeners();
    return toolsItems;
  }
}
