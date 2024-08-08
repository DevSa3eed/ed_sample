import 'package:ed_sample/features/add_new_beneficiary/presentation/bloc/add_new_beneficiary_bloc.dart';
import 'package:ed_sample/features/add_new_beneficiary/presentation/bloc/add_new_beneficiary_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/dependancy_injection/injection_container.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/input_text_field.dart';
import '../../../../core/util/mixin/flush_bar_mixin.dart';
import '../../../../core/util/widgets/submit_button_widget.dart';

class AddBeneficiaryPage extends StatefulWidget {
  @override
  State<AddBeneficiaryPage> createState() => _AddNewBeneficiaryPageState();
}

class _AddNewBeneficiaryPageState extends State<AddBeneficiaryPage>
    with FlushBarMixin {
  final _bloc = getIt<AddNewBeneficiaryBloc>();
  final scaffoldState = GlobalKey<ScaffoldState>();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNewBeneficiaryBloc, AddNewBeneficiaryState>(
      bloc: _bloc,
      listener: (BuildContext context, AddNewBeneficiaryState state) {
        if (state.beneficiaryAdded) {
          Navigator.pop(context, {"beneficiary": state.newBeneficiary});
        }
      },
      child: BlocBuilder<AddNewBeneficiaryBloc, AddNewBeneficiaryState>(
        bloc: _bloc,
        builder: (context, AddNewBeneficiaryState state) {
          return Scaffold(
            key: scaffoldState,
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: AppBar(
                backgroundColor: Color(0xffF8F7F7),
                elevation: 0.0,
              ),
            ),
            body: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                if (orientation == Orientation.portrait) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      child: Column(
                        children: [
                          headerPage(),
                          SizedBox(height: 35),
                          formAddBeneficiary(state),
                        ],
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
                                headerPage(),
                                formAddBeneficiary(state),
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
                                SizedBox(height: 12.0),
                                formAddBeneficiary(state),
                                SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget formAddBeneficiary(AddNewBeneficiaryState state) {
    return Column(
      children: [
        InputTextField(
          title: 'Nickname',
          hintText: "Enter nickname",
          inputType: TextInputType.text,
          onSubmit: (val) {},
          onChanged: _bloc.onNicknameChanged,
          controller: nicknameController,
          showError: state.errorNicknameValidation,
          errorText: "Invalid nickname!",
          prefixIcon: Icon(
            Icons.text_fields,
            size: 20.0,
          ),
        ),
        SizedBox(height: 8.0),
        InputTextField(
          title: 'Phone Number',
          hintText: "Enter phone number, e.g., 552711410",
          inputType: TextInputType.number,
          onSubmit: (val) {},
          onChanged: _bloc.onPhoneNumberChanged,
          controller: phoneNumberController,
          showError: state.errorPhoneNumberValidation,
          errorText: "Invalid phone number!",
          prefixIcon: Text(
            "+971",
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(height: 12.0),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 65,
            color: WHITE,
            child: SubmitButtonWidget(
              color: MAIN1,
              title: "Submit",
              onTap: _bloc.onAddBeneficiary,
              isLoading:
                  state.isAddingBeneficiary, // Updated to reflect loading state
            ),
          ),
        ),
      ],
    );
  }

  Widget headerPage() {
    return Column(
      children: [
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Add Beneficiary",
              style: TextStyle(
                color: MAIN1,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: TEXT_FIELD_COLOR,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 6.0),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "I am happy to see you again. You can add a new beneficiary under your account here!",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: DARK_OFF_FONT,
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }
}
