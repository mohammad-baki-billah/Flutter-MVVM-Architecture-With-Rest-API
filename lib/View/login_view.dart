import 'package:flutter/material.dart';
import 'package:mvvm/Res/Components/round_button.dart';
import 'package:mvvm/Utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passwardController = TextEditingController();

FocusNode _emailFocusNode = FocusNode();
FocusNode _passwordFocusNode = FocusNode();

ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Email TextField
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: _emailFocusNode,
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, _emailFocusNode, _passwordFocusNode);
                },
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // Password TextField
              ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwardController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: '*',
                    focusNode: _passwordFocusNode,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(_obsecurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * 0.1,
              ),

              // Login Button
              RoundButton(
                title: 'Login',
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Enter your Email', context);
                  } else if (_passwardController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Enter your password', context);
                  } else if (_passwardController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        'Password must be 6 character', context);
                  } else {
                    print("Api call here");
                  }
                },
                
              ),

              // login Button
            ],
          ),
        ),
      ),
    );
  }
}
