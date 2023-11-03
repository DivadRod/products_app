import 'package:flutter/material.dart';
import 'package:products_app/screens/screen.dart';
import 'package:products_app/services/products_services.dart';
import 'package:products_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemToolsService = Provider.of<ItemToolsService>(context);

    if (itemToolsService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: ListView.builder(
        itemCount: itemToolsService.toolsItems.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'product'),
          child: ProductCard(itemTool: itemToolsService.toolsItems[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
