import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dependancy_injection/injection_container.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/generate_screen.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _bloc = getIt<SplashBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: _bloc,
        listener: (BuildContext context, SplashState state) {
          goToTruthPage(state.userStatus);
        },
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: AppBar(
                backgroundColor: MAIN1,
                elevation: 0.0,
              )),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: MAIN1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/icon.png',
                    height: 150,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "Ed Topup",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void goToTruthPage(int status) {
    print("Status : $status");
    switch (status) {
      case -2:
        Navigator.pushNamedAndRemoveUntil(
            context, Screens.SIGN_UP, (route) => false);
        break;
    }
  }
}
