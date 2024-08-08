import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'colors.dart';

class SubmitButton extends StatelessWidget {
  final String submitMessage;
  final String cancelMessage;
  final Function? onSubmit;
  final Function? onCancel;
  final bool isLoading;
  final double? heightSubmit;
  final double? widthSubmit;
  final localizations;
  final Color color;
  final bool withCancel;

  SubmitButton(
      {required this.submitMessage,
      required this.cancelMessage,
      required this.localizations,
      this.onCancel,
      this.onSubmit,
      required this.isLoading,
      this.heightSubmit,
      this.widthSubmit,
      this.color = MAIN1,
      this.withCancel = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onSubmit!(),
          child: Container(
            height: heightSubmit, // 45
            width: widthSubmit, // 165
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Center(
              child: isLoading
                  ? SpinKitThreeBounce(size: 17.0, color: WHITE)
                  : Text(
                      submitMessage,
                      style: localizations.localeName == 'en'
                          ? TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500)
                          : TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500),
                    ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        !withCancel
            ? Container()
            : GestureDetector(
                onTap: () => onCancel!(),
                child: Text(
                  cancelMessage,
                  style: TextStyle(fontSize: 16, color: DARK_OFF_FONT),
                ),
              )
      ],
    );
  }
}
