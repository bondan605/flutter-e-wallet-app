import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/user/user_bloc.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/data_provider_page.dart';
import 'package:bank_sha/ui/pages/data_success_page.dart';
import 'package:bank_sha/ui/pages/home_page.dart';
import 'package:bank_sha/ui/pages/onboarding_page.dart';
import 'package:bank_sha/ui/pages/pin_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_pin_page.dart';
import 'package:bank_sha/ui/pages/profile_edit_success_page.dart';
import 'package:bank_sha/ui/pages/profile_page.dart';
import 'package:bank_sha/ui/pages/sign_in_page.dart';
import 'package:bank_sha/ui/pages/sign_up_page.dart';
import 'package:bank_sha/ui/pages/sign_up_success_page.dart';
import 'package:bank_sha/ui/pages/splash_page.dart';
import 'package:bank_sha/ui/pages/topup_page.dart';
import 'package:bank_sha/ui/pages/topup_success.dart';
import 'package:bank_sha/ui/pages/transfer_page.dart';
import 'package:bank_sha/ui/pages/transfer_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: blackColor,
            ),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ),
        routes: {
          '/': (context) => SplashPage(),
          '/onboarding': (context) => OnboardingPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-up-success': (context) => SignUpSuccessPage(),
          '/home': (context) => HomePage(),
          '/profile': (context) => ProfilePage(),
          '/pin': (context) => PinPage(),
          '/profile-edit': (context) => ProfileEditPage(),
          '/profile-edit-pin': (context) => ProfileEditPinPage(),
          '/profile-edit-success': (context) => ProfileEditSuccessPage(),
          '/topup': (context) => TopupPage(),
          '/topup-success': (context) => TopupSuccessPage(),
          '/transfer': (context) => TransferPage(),
          '/transfer-success': (context) => TransferSuccessPage(),
          '/data-provider': (context) => DataProviderPage(),
          '/data-success': (context) => DataSuccessPage(),
        },
      ),
    );
  }
}
