import 'package:flutter/material.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/navigation/app_navigation.dart';
import 'package:movie_app/core/presentation/widgets/message/display_message_widget.dart';
import 'package:movie_app/features/auth/data/models/sign_up_request_params_model.dart';
import 'package:movie_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:movie_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:movie_app/features/auth/presentation/widgets/email_textfield_widget.dart';
import 'package:movie_app/features/auth/presentation/widgets/password_textfield_widget.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_button_widget.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_text_widget.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_link_text_widget.dart';
import 'package:movie_app/features/home/presentation/pages/home_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthTitleTextWidget(text: 'Sign Up'),
            const SizedBox(height: 30),
            EmailTextFieldWidget(controller: _emailController),
            const SizedBox(height: 20),
            PasswordTextFieldWidget(controller: _passwordController),
            const SizedBox(height: 60),
            AuthButtonWidget(
              title: 'Sign Up',
              onPressed:
                  () async => serviceLocator<SignUpUseCase>().call(
                    params: SignUpRequestParamsModel(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  ),
              onSuccess: () {
                AppNavigator.pushAndRemove(context, HomePage());
              },
              onFailure: (error) {
                DisplayMessageWidget.errorMessage(error, context);
              },
            ),
            const SizedBox(height: 20),
            AuthLinkTextWidget(
              context,
              prefixText: 'Already have an account? ',
              linkText: 'Sign In',
              pageRoute: SignInPage(),
            ),
          ],
        ),
      ),
    );
  }
}
