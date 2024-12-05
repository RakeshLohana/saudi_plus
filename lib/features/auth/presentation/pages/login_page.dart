import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_plus/core/constants/route_strings.dart';
import 'package:saudi_plus/core/theme/app_color.dart';
import 'package:saudi_plus/core/utils/custom_text.dart';
import 'package:saudi_plus/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:saudi_plus/features/auth/presentation/bloc/auth_event.dart';
import 'package:saudi_plus/features/auth/presentation/bloc/auth_state.dart';
import 'package:saudi_plus/features/auth/presentation/widgets/custombutton.dart';
import 'package:saudi_plus/features/auth/presentation/widgets/textinput.dart';
import 'package:saudi_plus/features/auth/presentation/widgets/touchabletext.dart';
import 'package:saudi_plus/l10n/app_local.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocal.init(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login Page'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(90),
                      bottomLeft: Radius.circular(90)),
                  color: AppColor.bottomLabel),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Custom logic before going back
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColor.black,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: AppLocal.loc.login_text,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    AppLocal.loc.email_text,
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Textinput(
                    controller: _usernameController,
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is Required';
                      }
                      if (!value.isValidEmail()) {
                        return 'Please Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    AppLocal.loc.password,
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Textinput(
                    controller: _passwordController,
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is Required';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteStrings.forgetPasswordScreen);
                      },
                      child: Text(
                        AppLocal.loc.forgot_password,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 120),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(AppLocal.loc.login_success)),
                        );
                        // Navigate to another page if needed
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteStrings.mainDashboardScreen , (route) => false);
                      } else if (state is LoginFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error)),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return Center(
                            child: const CircularProgressIndicator());
                      }
                      return Center(
                        child: CustomButton(
                          text: AppLocal.loc.login,
                          color: AppColor.bottomLabel,
                          radius: 10,
                          fontSize: 20,
                          padding: EdgeInsets.symmetric(
                              horizontal: 70, vertical: 10),
                          onPressed: () {
                            context.read<AuthBloc>().add(
                              LoginButtonPressed(
                                username: _usernameController.text,
                                password: _passwordController.text,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: TouchableText(
                        text: AppLocal.loc.register,
                        onTap: () {
                          Navigator.of(context).pushNamed(RouteStrings.registerScreen);
                        },
                        textColor: AppColor.black,
                        underlineColor: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        AppLocal.loc.read_about,
                        style: TextStyle(
                          fontSize: 16, // Optional font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TouchableText(
                        text: AppLocal.loc.terms_and_conditions,
                        onTap: () {},
                        textColor: AppColor.bottomLabel,
                        underlineColor: AppColor.bottomLabel,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        AppLocal.loc.also_read,
                        style: TextStyle(
                          fontSize: 16, // Optional font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TouchableText(
                        text: AppLocal.loc.usage_policy,
                        onTap: () {},
                        textColor: AppColor.purple,
                        underlineColor: AppColor.purple,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
