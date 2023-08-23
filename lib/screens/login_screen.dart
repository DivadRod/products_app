import 'package:flutter/material.dart';
import 'package:products_app/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

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
            const SizedBox(height: 250),
            CardContainer(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text('Login',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 10),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _Formulario(),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Crear una nueva cuenta',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
          ],
        )),
      ),
    );
  }
}

class _Formulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      /*
      FORMULARIO
      */
      child: Form(
          key: loginForm.formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          //key: ,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'email.address@gmail.com',
                    labelText: 'Correo electronico',
                    prefixIcon: Icons.alternate_email_rounded),
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(pattern);

                  return regExp.hasMatch(value ?? '') ? null : 'Enter an email';
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '*******',
                  labelText: 'Password',
                  prefixIcon: Icons.lock_outline,
                ),
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  return (value != null && value.length >= 6)
                      ? null
                      : 'Password must be 6 characters';
                },
              ),
              const SizedBox(height: 50),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.deepPurple,
                elevation: 0,
                // ignore: sort_child_properties_last
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Esperando' : 'Ingresar',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                /*
                Si el form esta cargando devuelve un --- ? null ---
                en caso contrario --- : laFuncion() async ---
                */
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        //Ocultar teclado
                        FocusScope.of(context).unfocus();

                        if (!loginForm.isValidForm()) return;

                        // TODO: validar
                        loginForm.isLoading = true;

                        await Future.delayed(const Duration(seconds: 2));

                        //TODO: validar si el login es correcto
                        loginForm.isLoading = false;

                        Navigator.pushReplacementNamed(context, 'home');
                      },
              ),
              const SizedBox(height: 50),
            ],
          )),
    );
  }
}
