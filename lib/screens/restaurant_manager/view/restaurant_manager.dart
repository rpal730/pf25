import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio_2025/res/brutalism_container.dart';
import 'package:flutter_web_portfolio_2025/res/loader.dart';
import 'package:flutter_web_portfolio_2025/res/tappable_effect.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/cubit/restaurant_manager_cubit.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/cubit/restaurant_manager_state.dart';

@RoutePage()
class RestaurantManagerScreen extends StatelessWidget {
  const RestaurantManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantManagerCubit()..setLoadersToInit(),
      child: BlocBuilder<RestaurantManagerCubit, RestaurantManagerState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.accentYellow,
            appBar: AppBar(
              backgroundColor: AppColors.accentYellow,
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              centerTitle: true,
              title: InkWell(
                onTap: () => context.router.pop(),
                child: BrutalismContainer(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  SizedBox(height: 12),
                  Text('Restaurant Manager', style: TextStyle(fontSize: 30)),

                  SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          context
                              .read<RestaurantManagerCubit>()
                              .showRestaurantSignInForm(true);
                        },
                        child: BrutalismContainer(child: Text('Sign In')),
                      ),
                      SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          context
                              .read<RestaurantManagerCubit>()
                              .showRestaurantSignInForm(false);
                        },
                        child: BrutalismContainer(
                          child: Text('Sign Up'),
                          color: AppColors.background,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 42),

                  if (state.showSignInForm == true)
                    SizedBox(
                      width: figmaScreenWidth,
                      child: RestaurantManagerSignInForm(),
                    ),

                  if (state.showSignInForm == false)
                    SizedBox(
                      width: figmaScreenWidth,
                      child: RestaurantManagerSignUpForm(),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RestaurantManagerSignInForm extends StatelessWidget {
  const RestaurantManagerSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BrutalismContainer(
      child: Column(
        children: [
          TextField(
            controller:
                context.read<RestaurantManagerCubit>().usernameController,
            decoration: InputDecoration(hintText: 'Enter username'),
          ),
          SizedBox(height: 12),
          TextField(
            obscureText: true,
            controller:
                context.read<RestaurantManagerCubit>().passwordController,
            decoration: InputDecoration(hintText: 'Enter password'),
          ),

          SizedBox(height: 12),
          if ((context.read<RestaurantManagerCubit>().state.isLoading ?? false))
            CustomLoaderBar()
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    await context.read<RestaurantManagerCubit>().loginUser(
                      context,
                    );
                  },
                  child: BrutalismContainer(
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: AppColors.background,
                  ),
                ),
                SizedBox(width: 12),

                BrutalismContainer(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  color: AppColors.background,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class RestaurantManagerSignUpForm extends StatelessWidget {
  const RestaurantManagerSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BrutalismContainer(
      color: AppColors.background,
      child: Column(
        children: [
          TextField(
            controller: context.read<RestaurantManagerCubit>().nameController,
            decoration: InputDecoration(hintText: 'Enter name'),
          ),
          SizedBox(height: 12),
          TextField(
            controller:
                context.read<RestaurantManagerCubit>().usernameController,
            decoration: InputDecoration(hintText: 'Enter username'),
          ),
          SizedBox(height: 12),
          TextField(
            obscureText: true,
            controller:
                context.read<RestaurantManagerCubit>().passwordController,
            decoration: InputDecoration(hintText: 'Enter password'),
          ),
          SizedBox(height: 12),
          TextField(
            controller:
                context.read<RestaurantManagerCubit>().restaurantNameController,
            decoration: InputDecoration(hintText: 'Restaurant name'),
          ),
          SizedBox(height: 12),
          TextField(
            controller:
                context
                    .read<RestaurantManagerCubit>()
                    .restaurantGSTINController,
            decoration: InputDecoration(
              hintText: 'Restaurant GSTIN (optional)',
            ),
          ),
          SizedBox(height: 12),

          TextField(
            controller: context.read<RestaurantManagerCubit>().upiIdController,
            decoration: InputDecoration(hintText: 'Enter UPI ID for payments'),
          ),

          SizedBox(height: 12),
          if (!(context.read<RestaurantManagerCubit>().state.isLoading ??
              false))
            InkWell(
              onTap: () {
                context.read<RestaurantManagerCubit>().signUpRestaurant(
                  context,
                );
              },
              child: BrutalismContainer(
                child: Text(
                  'Sign up',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                color: AppColors.primary,
              ),
            )
          else
            CustomLoaderBar(),
        ],
      ),
    );
  }
}
