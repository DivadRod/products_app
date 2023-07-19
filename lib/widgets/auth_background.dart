import 'package:flutter/material.dart';

class AuthBackgound extends StatelessWidget {
  const AuthBackgound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [_PurpleBox()],
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * 0.4,
        decoration: _purpleGradientBackground(),
        child: const Stack(
          children: [
            Positioned(top: 150, left: 70, child: _Bubble()),
            Positioned(top: 280, left: -20, child: _Bubble()),
            Positioned(top: -50, left: -20, child: _Bubble()),
            Positioned(top: 280, left: 320, child: _Bubble()),
            Positioned(top: 70, left: 270, child: _Bubble()),
          ],
        ));
  }

  BoxDecoration _purpleGradientBackground() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1),
      ]));
}

class _Bubble extends StatelessWidget {
  const _Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
