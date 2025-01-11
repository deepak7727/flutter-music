import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/color_res.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_application_1/utils/common/custome_button_widget.dart';
import 'package:flutter_application_1/utils/global/image_res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
// TabController _tabController = TabController(length: 2, vsync: vsync);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Profie Images
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                ImageRes.profileBgImage,
                fit: BoxFit.contain,
              ),
              Positioned(
                bottom: -50.h,
                child: Image.asset(
                  ImageRes.cd2Image,
                  height: 100.h,
                ),
              ),
            ],
          ),
          SizedBox(height: 60.h),
          // Profile main info
          Column(
            children: [
              Text(
                "Melissa Person",
                style: Styles.textStyle(),
              ),
              SizedBox(height: 5.h),
              Text(
                "Interior designer",
                style: Styles.textStyle(),
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 10.w),
                  Text(
                    "Lagos, Nigriaaaa",
                    style: Styles.textStyle(),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    // followers details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("112"),
                            Text("followers"),
                          ],
                        ),
                        Column(
                          children: [
                            Text("67"),
                            Text("following"),
                          ],
                        ),
                        Column(
                          children: [
                            Text("37k"),
                            Text("likes"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    // buttons
                    Row(
                      children: [
                        Expanded(
                          child: EvolvedButton(
                            text: "Edit Profile",
                            buttonColor: ColorRes.primaryColor,
                            textWidegt: Text(
                              "Edit Profile",
                              style: Styles.textStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(width: 25.w),
                        Expanded(
                          child: EvolvedButton(
                            text: "Add Friends",
                            buttonColor: ColorRes.primaryColor,
                            textWidegt: Text(
                              "Add Friends",
                              style: Styles.textStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
