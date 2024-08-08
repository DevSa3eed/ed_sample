import 'package:flutter/material.dart';
import '../../../../core/util/colors.dart';

class HeaderSignUpWidget extends StatelessWidget {
  final bool withBackBtn;

  const HeaderSignUpWidget({super.key, this.withBackBtn = false});

  @override
  Widget build(BuildContext context) {
    return main(context);
  }

  Widget main(BuildContext context) {
    if (withBackBtn) {
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
    } else {
      return Column(
        children: [
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Welcome to Ed Topup!",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
              Image.asset(
                'assets/images/profile.png',
                width: 30.0,
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Hello, I guess you are new around here. You can start using the application after sign up.",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: DARK_OFF_FONT, fontSize: 15.0),
            ),
          )
        ],
      );
    }
  }
}
