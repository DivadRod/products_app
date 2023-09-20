import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _builldBoxDecoration(),
        width: double.infinity,
        height: 450,
        child: FadeInImage(
          image: NetworkImage('https://via.placeholder.com/400x300'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        ),
      ),
    );
  }

  BoxDecoration _builldBoxDecoration() => BoxDecoration(
          color: Colors.red,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 5))
          ]);
}
