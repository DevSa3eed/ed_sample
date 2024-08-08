import 'package:ed_sample/core/util/generate_screen.dart';
import 'package:ed_sample/core/util/widgets/submit_button_widget.dart';
import 'package:ed_sample/features/sign_up/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dependancy_injection/injection_container.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/input_text_field.dart';
import '../bloc/sign_up_bloc.dart';
import '../bloc/sign_up_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  final scaffoldState = GlobalKey<ScaffoldState>();
  final _bloc = getIt<SignUpBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (BuildContext context, SignUpState state) {
        if (state.userSignedUp) {
          Navigator.pushNamedAndRemoveUntil(
              context, Screens.MAIN_PAGE, (route) => false);
        }
      },
      child: BlocBuilder(
        bloc: _bloc,
        builder: (context, SignUpState state) {
          return Scaffold(
              key: scaffoldState,
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
                      Orientation.portrait) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          child: Column(children: [
                            HeaderSignUpWidget(),
                            SizedBox(
                              height: 20.0,
                            ),
                            formSignUp(state),
                            createAnAccount(),
                            continueAsGuestWidget()
                          ]),
                        ),
                      ),
                    );
                  } else {
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
                              child: Column(
                                children: [
                                  HeaderSignUpWidget(),
                                  createAnAccount()
                                ],
                              ),
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
                                  formSignUp(state),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ));
        },
      ),
    );
  }

  Widget formSignUp(SignUpState state) {
    return Column(
      children: [
        InputTextField(
            title: 'ss',
            hintText: "Email",
            inputType: TextInputType.name,
            onSubmit: (val) {},
            onChanged: _bloc.onEmailChanged,
            controller: emailController,
            showError: state.errorEmailValidation,
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
            onChanged: _bloc.onPasswordChanged,
            controller: passwordController,
            showError: state.errorPasswordValidation,
            errorText: "Invalid input!",
            obscureText: state.isPasswordObscured,
            suffixIcon: GestureDetector(
              onTap: _bloc.onPasswordObscureChanged,
              child: Icon(
                state.isPasswordObscured
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
        InputTextField(
            title: 'ss',
            hintText: "Confirm password",
            inputType: TextInputType.name,
            onSubmit: (val) {},
            onChanged: _bloc.onConfirmPasswordChanged,
            controller: confirmPasswordController,
            showError: state.errorConfirmPasswordValidation,
            errorText: "Invalid input!",
            obscureText: state.isConfirmPasswordObscured,
            suffixIcon: GestureDetector(
              onTap: _bloc.onConfirmPasswordObscureChanged,
              child: Icon(
                state.isConfirmPasswordObscured
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
        InputTextField(
            title: 'ss',
            hintText: "Phone number",
            inputType: TextInputType.number,
            onSubmit: (val) {},
            onChanged: _bloc.onPhoneNumberChanged,
            controller: phoneNumberController,
            showError: state.errorPhoneNumberValidation,
            errorText: "Invalid input!",
            prefixIcon: Icon(
              Icons.phone,
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
              title: "Sign Up",
              onTap: _bloc.onSignUpSubmit,
              isLoading: state.isSigningUp,
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
              "Already have an account?" + " ",
              style: TextStyle(color: DARK_OFF_FONT, fontSize: 16.0),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Screens.SIGN_IN);
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

  Widget continueAsGuestWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, Screens.CONTINUE_AS_GUEST);
        },
        child: Text(
          "Continue as guest?",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
