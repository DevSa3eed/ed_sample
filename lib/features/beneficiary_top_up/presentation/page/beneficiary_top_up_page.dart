import 'package:ed_sample/core/domain/entity/beneficiary_entity.dart';
import 'package:ed_sample/core/error/failures.dart';
import 'package:ed_sample/core/util/constants.dart';
import 'package:ed_sample/features/beneficiary_top_up/presentation/bloc/beneficiary_top_up_bloc.dart';
import 'package:ed_sample/features/beneficiary_top_up/presentation/bloc/beneficiary_top_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/dependancy_injection/injection_container.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/input_text_field.dart';
import '../../../../core/util/mixin/flush_bar_mixin.dart';
import '../../../../core/util/widgets/submit_button_widget.dart';

class BeneficiaryTopUpPage extends StatefulWidget {
  final BeneficiaryEntity beneficiaryEntity;

  BeneficiaryTopUpPage(this.beneficiaryEntity);

  @override
  State<BeneficiaryTopUpPage> createState() => _BeneficiaryTopUpPageState();
}

class _BeneficiaryTopUpPageState extends State<BeneficiaryTopUpPage>
    with FlushBarMixin {
  final _bloc = getIt<BeneficiaryTopUpBloc>();
  final scaffoldState = GlobalKey<ScaffoldState>();
  TextEditingController amountController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (BuildContext context, BeneficiaryTopUpState state) {
        if (state.amountTransferred) {
          Navigator.pop(context, {"historyItem": state.newTopUpEntity});
        }
        if (state.errorToppingUp) {
          if (state.failure != null &&
              (state.failure as ServerFailure).errorCode ==
                  ErrorCode.INSUFFICIENT_BALANCE)
            exceptionFlushBar(
                title: "Error!",
                context: context,
                message: "Insufficient balance!",
                duration: Duration(milliseconds: 1750),
                onChangeStatus: (status) {},
                onHidden: () {});
          _bloc.onClearErrors();
        }
      },
      child: BlocBuilder(
        bloc: _bloc,
        builder: (context, BeneficiaryTopUpState state) {
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
                            headerPage(),
                            SizedBox(
                              height: 35,
                            ),
                            formAddBeneficiary(state),
                            SizedBox(
                              height: 12.0,
                            ),
                            fixedAmountsWidget(state),
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
                                  title: "Top Up",
                                  onTap: () => _bloc
                                      .onTopUpSubmit(widget.beneficiaryEntity),
                                  isLoading: false,
                                ),
                              ),
                            )
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
                                  headerPage(),
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
                                  formAddBeneficiary(state),
                                  fixedAmountsWidget(state),
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
                                        title: "Top Up",
                                        onTap: () => _bloc.onTopUpSubmit(
                                            widget.beneficiaryEntity),
                                        isLoading: false,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  )
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

  Widget fixedAmountsWidget(BeneficiaryTopUpState state) {
    return Wrap(
      children: List.generate(
          state.fixedAmounts.length,
          (index) => Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 4.0),
                child: GestureDetector(
                  onTap: () {
                    _bloc.onAmountChanged(state.fixedAmounts[index].toString());
                    amountController.text =
                        state.fixedAmounts[index].toString();
                  },
                  child: Container(
                    width: 80,
                    decoration: getFixedAmountBoxDecoration(
                        state.fixedAmounts[index], state),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 8.0),
                        child: Text(
                          "AED ${state.fixedAmounts[index]}",
                          style: TextStyle(
                              color: state.amount.isNotEmpty &&
                                      _bloc.inputValidators
                                          .isNumeric(state.amount) &&
                                      num.parse(state.amount) ==
                                          state.fixedAmounts[index]
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
    );
  }

  Widget formAddBeneficiary(BeneficiaryTopUpState state) {
    return Column(
      children: [
        InputTextField(
            title: 'ss',
            hintText: "Amount: 250...",
            inputType: TextInputType.number,
            onSubmit: (val) {},
            onChanged: _bloc.onAmountChanged,
            controller: amountController,
            showError: state.errorAmountValidation,
            errorText: "Invalid input!",
            prefixIcon: Icon(
              Icons.text_fields,
              size: 20.0,
            )),
      ],
    );
  }

  Widget headerPage() {
    return Column(
      children: [
        SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Top Up (${widget.beneficiaryEntity.nickName})",
                maxLines: 2,
                style: TextStyle(
                    color: MAIN1, fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
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
            "I am happy to see you again. You can add new beneficiary under your account here!.",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: DARK_OFF_FONT, fontSize: 15.0),
          ),
        )
      ],
    );
  }

  BoxDecoration getFixedAmountBoxDecoration(
      int val, BeneficiaryTopUpState state) {
    if (state.amount.isNotEmpty &&
        _bloc.inputValidators.isNumeric(state.amount) &&
        num.parse(state.amount) == val) {
      return BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          gradient:
              LinearGradient(colors: [Color(0xff5269B3), Color(0XFF6E8ECD)]),
          boxShadow: [
            BoxShadow(
                blurRadius: 5, color: Colors.black12, offset: Offset(0, 3))
          ]);
    } else {
      return BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.white,
          border: Border.all(color: MAIN1),
          boxShadow: [
            BoxShadow(
                blurRadius: 5, color: Colors.black12, offset: Offset(0, 3))
          ]);
    }
  }
}
