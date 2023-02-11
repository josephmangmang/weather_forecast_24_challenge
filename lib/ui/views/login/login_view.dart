import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_forecast_24_challenge/ui/common/ui_helpers.dart';

import '../../../resources/resources.dart';
import '../../widgets/widgets.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            AppToolbar(
              title: S.current.appName,
            ),
            verticalSpace(100),
            Text(
              S.current.welcomeMessage,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, height: 1.5),
            ),
            verticalSpace(50),
            AppButton(
              label: S.current.login,
              onPressed: viewModel.loginPressed,
            )
          ],
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
