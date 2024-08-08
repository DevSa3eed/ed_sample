import 'package:ed_sample/core/util/generate_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dependancy_injection/injection_container.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/input_text_field.dart';
import '../../../../core/util/mixin/flush_bar_mixin.dart';
import '../../../../core/util/widgets/submit_button_widget.dart';
import '../bloc/sign_in_bloc.dart';
import '../bloc/sign_in_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with FlushBarMixin {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _bloc = getIt<SignInBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (BuildContext context, SignInState state) {
        if (state.userSignedIn) {
          Navigator.pushNamedAndRemoveUntil(
              context, Screens.MAIN_PAGE, (route) => false);
        }
        if (state.errorSignIn) {
          exceptionFlushBar(
              title: "Error!",
              context: context,
              message: "The account is not exists!",
              duration: Duration(milliseconds: 1750),
              onChangeStatus: (status) {},
              onHidden: () {
                _bloc.onClear();
              });
        }
      },
      child: BlocBuilder(
        bloc: _bloc,
        builder: (context, SignInState state) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(0.0),
                  child: AppBar(
                    backgroundColor: Color(0xffF8F7F7),
                    elevation: 0.0,
                  )),
              body: OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
                  if (MediaQuery.of(context).orientation ==
                      Orientation.landscape) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width / 2) - 10,
                            height: MediaQuery.of(context).size.height,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: headerLogin(),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width / 2) - 10,
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  formLogin(state),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  // createAnAccount()
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          child: Column(
                            children: [
                              headerLogin(),
                              SizedBox(
                                height: 50.0,
                              ),
                              formLogin(state),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ));
        },
      ),
    );
  }

  Widget headerLogin() {
    return Column(
      children: [
        SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Image.asset(
                  'assets/images/profile.png',
                  width: 30.0,
                )
              ],
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: TEXT_FIELD_COLOR),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "I am happy to see you again. You can check your subscribe requests to your company after sign in.",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: DARK_OFF_FONT, fontSize: 15.0),
          ),
        )
      ],
    );
  }

  Widget formLogin(SignInState state) {
    return Column(
      children: [
        InputTextField(
            title: 'ss',
            hintText: "Username",
            inputType: TextInputType.name,
            onSubmit: (val) {},
            onChanged: _bloc.onChangedUserName,
            controller: emailController,
            showError: state.errorUserNameValidation,
            errorText: "Invalid input!",
            prefixIcon: Icon(
              Icons.email,
              size: 20.0,
            )),
        SizedBox(
          height: 12.0,
        ),
        InputTextField(
            title: 'ss',
            hintText: "Password",
            inputType: TextInputType.name,
            onSubmit: (val) {},
            onChanged: _bloc.onChangedPassword,
            controller: passwordController,
            showError: state.errorPasswordValidation,
            errorText: "Invalid input!",
            obscureText: state.isSecureText,
            suffixIcon: GestureDetector(
              onTap: _bloc.onObscureChanged,
              child: Icon(
                state.isSecureText
                    ? Icons.remove_red_eye
                    : Icons.panorama_fish_eye,
                color: DARK_OFF_FONT,
              ),
            ),
            prefixIcon: Icon(
              Icons.lock,
              size: 20.0,
            )),
        SizedBox(
          height: 12.0,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 65,
            color: WHITE,
            child: SubmitButtonWidget(
              color: MAIN1,
              title: "Submit",
              onTap: _bloc.onSignInSubmit,
              isLoading: state.isSigningIn,
            ),
          ),
        ),
      ],
    );
  }

  Widget createAnAccount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You don’t have an account?" + " ",
              style: TextStyle(color: DARK_OFF_FONT, fontSize: 16.0),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Sign In",
                style: TextStyle(color: MAIN1, fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
