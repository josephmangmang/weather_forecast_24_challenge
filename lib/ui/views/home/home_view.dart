import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../models/user.dart';
import '../../../resources/resources.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/widgets.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            AppToolbar(
              trailing: AppButton(
                label: S.current.logout,
                onPressed: viewModel.logoutPressed,
              ),
            ),
            verticalSpace(100),
            OptionalView<User>(
                value: viewModel.user,
                builder: (context, value) => UserProfileView(user: value)),
            TextField(
              decoration: InputDecoration(
                hintText: S.current.hintCity,
                filled: false,
                isDense: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Theme.of(context).focusColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
              onChanged: viewModel.onSearchTextChanged,
            ),
            verticalSpace(16),
            AppButton(
              label: S.current.displayWeather,
              onPressed: viewModel.displayWeatherPressed,
            )
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.init();

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
