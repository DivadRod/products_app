import 'package:flutter/material.dart';
import 'package:products_app/ui/input_decoration.dart';
import 'package:products_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgound(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 250),
            CardContainer(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text('Login',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 10),
                  _Formulario(),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Crear una nueva cuenta',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        )),
      ),
    );
  }
}

class _Formulario extends StatelessWidget {
  const _Formulario({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'email.address@gmail.com',
                labelText: 'Correo electronico',
                prefixIcon: Icons.alternate_email_rounded),
          ),
          const SizedBox(height: 30),
          TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Password',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline,
              )),
          const SizedBox(height: 50),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.deepPurple,
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: const Text(
                'Ingresar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            onPressed: () {},
          ),
          const SizedBox(height: 50),
        ],
      )),
    );
  }
}
