import 'package:ed_sample/core/util/colors.dart';
import 'package:ed_sample/core/util/extensions/extension_on_context.dart';
import 'package:ed_sample/core/util/generate_screen.dart';
import 'package:ed_sample/core/util/mixin/flush_bar_mixin.dart';
import 'package:ed_sample/features/main_page/presentation/bloc/main_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/dependancy_injection/injection_container.dart';
import '../bloc/main_page_state.dart';
import '../widgets/beneficiary_card.dart';
import '../widgets/history_item_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with FlushBarMixin {
  final _bloc = getIt<MainPageBloc>();

  @override
  void initState() {
    _bloc.onInitializePage();
    super.initState();
  }

  @override
  Widget build(BuildContext mainContext) {
    return BlocListener(
      bloc: _bloc,
      listener: (BuildContext context, MainPageState state) {
        if (state.errorAddNewBeneficiary) {
          exceptionFlushBar(
              title: "Beneficiary not added!",
              message: "You can't add more than 5 beneficiary!",
              context: context,
              onChangeStatus: (status) {},
              onHidden: () {});
          _bloc.onClearErrors();
        }
        if (state.newBeneficiaryAdded) {
          doneFlushBar(
            title: 'Added!',
            message: "A new beneficiary added to your account!",
            context: context,
            onHidden: () {},
            backgroundColor: Colors.green,
            onChangeStatus: (status) {},
          );
          _bloc.onClearErrors();
        }
      },
      child: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, MainPageState state) {
          return Scaffold(
            backgroundColor: Color(0xFFF9F9F9),
            appBar: AppBar(
              backgroundColor: TEXT_FIELD_COLOR,
              centerTitle: false,
              title: Text(
                "Beneficiaries",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: MAIN1,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Lobster"),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Screens.ADD_BENEFICIARY)
                        .then((value) {
                      if (value != null &&
                          (value as Map)["beneficiary"] != null) {
                        _bloc.onAddNewBeneficiary((value)["beneficiary"]);
                      }
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    color: MAIN1,
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  balanceWidget(state, context),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 130,
                    width: context.w,
                    child: ListView.builder(
                        itemCount: state.beneficiaries.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return BeneficiaryCard(
                              beneficiaryEntity: state.beneficiaries[index],
                              onTopUpAdded: _bloc.onTopUpAdded);
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  getHistoryWidget(state)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getHistoryWidget(MainPageState state) {
    return Expanded(
        child: ListView.builder(
            itemCount: state.historyTopUPs.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  index == 0
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: Text(
                            "History Top UPs",
                            style: TextStyle(
                                color: MAIN1,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container(),
                  HistoryItemWidget(
                    topUpEntity: state.historyTopUPs[index],
                  ),
                ],
              );
            }));
  }

  Widget balanceWidget(MainPageState state, BuildContext context) {
    return state.currentUser == null
        ? Container()
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: state.currentUser!.isVerified ? MAIN2 : Colors.red,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state.currentUser!.isVerified
                        ? "User verified"
                        : "User is not verified!",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Balance: ${state.currentUser!.balance.toStringAsFixed(2)} AED",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
  }
}
