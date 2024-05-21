import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/SearchScreen/search_screen.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage("assets/images/doctor image search.jpg"),
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 10.h,
          left: 25.w,
          right: 25.w,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            child: Container(
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      "Search your Doctor",
                      style: TextStyle(fontSize: 15.sp, color: kSubTextColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: CircleAvatar(
                      backgroundColor: const Color(0xFF56B89C),
                      radius: 16,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          IconlyLight.search,
                          color: kCardColor,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
