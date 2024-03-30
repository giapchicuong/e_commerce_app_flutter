import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      TTexts.signupTitle,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
