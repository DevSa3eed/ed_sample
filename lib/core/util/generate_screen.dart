import 'package:flutter/material.dart';

// Main Pages
import 'package:ed_sample/features/main_page/presentation/pages/main_page.dart';
import 'package:ed_sample/features/splash/presentation/page/splash_page.dart';

// Authentication Pages
import 'package:ed_sample/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:ed_sample/features/sign_up/presentation/pages/continue_as_guest_page.dart';
import 'package:ed_sample/features/sign_up/presentation/pages/sign_up_page.dart';

// Beneficiary Pages
import 'package:ed_sample/features/beneficiary_top_up/presentation/page/beneficiary_top_up_page.dart';
import 'package:ed_sample/features/add_new_beneficiary/presentation/page/add_new_beneficiary_page.dart';

class GenerateScreen {
  static Route<dynamic> onGenerate(RouteSettings value) {
    String? name = value.name;
    print("current screen: $name");
    final args = value.arguments;
    switch (name) {
      case Screens.SPLASH_PAGE:
        return MaterialPageRoute(builder: (context) => SplashPage());

      case Screens.SIGN_IN:
        return MaterialPageRoute(builder: (context) => SignInPage());

      case Screens.SIGN_UP:
        return MaterialPageRoute(builder: (context) => SignUpPage());

      case Screens.CONTINUE_AS_GUEST:
        return MaterialPageRoute(builder: (context) => ContinueAsGuestPage());

      case Screens.MAIN_PAGE:
        return MaterialPageRoute(builder: (context) => MainPage());

      case Screens.ADD_BENEFICIARY:
        return MaterialPageRoute(builder: (context) => AddBeneficiaryPage());

      case Screens.TOP_UP_BENEFICIARY:
        return MaterialPageRoute(
            builder: (context) =>
                BeneficiaryTopUpPage((args as Map)["beneficiary"]));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}

class Screens {
  static const String SPLASH_PAGE = "/";
  static const String SIGN_IN = "/sign_in";
  static const String SIGN_UP = "/sign_up";
  static const String CONTINUE_AS_GUEST = "/guest-sign-up";
  static const String MAIN_PAGE = "/main-page";
  static const String ADD_BENEFICIARY = "/add-beneficiary";
  static const String TOP_UP_BENEFICIARY = "/top-up-beneficiary";
}
