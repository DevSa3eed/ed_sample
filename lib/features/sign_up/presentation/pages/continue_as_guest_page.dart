import 'package:ed_sample/features/sign_up/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependancy_injection/injection_container.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/generate_screen.dart';
import '../../../../core/util/input_text_field.dart';
import '../../../../core/util/widgets/submit_button_widget.dart';
import '../bloc/sign_up_bloc.dart';
import '../bloc/sign_up_state.dart';

class ContinueAsGuestPage extends StatefulWidget {
  const ContinueAsGuestPage({super.key});

  @override
  State<ContinueAsGuestPage> createState() => _ContinueAsGuestPageState();
}

class _ContinueAsGuestPageState extends State<ContinueAsGuestPage> {
  final _bloc = getIt<SignUpBloc>();
  final scaffoldState = GlobalKey<ScaffoldState>();
  TextEditingController phoneNumberController = new TextEditingController();

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
                            HeaderSignUpWidget(
                              withBackBtn: true,
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            formSignUp(state)
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
                                  HeaderSignUpWidget(
                                    withBackBtn: true,
                                  ),
                                  formSignUp(state)
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
              title: "Continue",
              onTap: _bloc.onContinueAsGuest,
              isLoading: state.isSigningUp,
            ),
          ),
        ),
      ],
    );
  }
}
