import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

mixin FlushBarMixin {
  void exceptionFlushBar(
      {required String title,
      required String message,
      required Function onHidden,
      required BuildContext context,
      required Function(FlushbarStatus)? onChangeStatus,
      Duration? duration}) {
    Flushbar(
      icon: Icon(
        Icons.info,
        color: Colors.red,
      ),
      onStatusChanged: (status) {
        onChangeStatus!(status!);
        print(status.toString());
      },
      title: title,
      margin: EdgeInsets.all(12.0),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      message: message,
      duration: duration == null ? Duration(milliseconds: 1000) : duration,
    ).show(context).then((value) {
      onHidden();
    });
  }

  void doneFlushBar(
      {required String title,
      required String message,
      required Function onHidden,
      required BuildContext context,
      required Color backgroundColor,
      required Function(FlushbarStatus)? onChangeStatus,
      Duration? duration}) {
    Flushbar(
      backgroundColor: backgroundColor,
      icon: Icon(
        Icons.done,
        color: Colors.white,
      ),
      onStatusChanged: (status) {
        onChangeStatus!(status!);
        print(status.toString());
      },
      title: title,
      margin: EdgeInsets.all(12.0),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      message: message,
      duration: duration == null ? Duration(milliseconds: 1000) : duration,
    ).show(context).then((value) {
      onHidden();
    });
  }
}
