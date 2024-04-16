
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/LocationScreen/location_screen.dart';

class HomeAappBar extends StatelessWidget {
  const HomeAappBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        children: [
          Icon(
            Icons.location_on,
            size: 20.sp,
            color: Colors.white,
          ),
          const HorizontalSpacingWidget(width: 5),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LocationScreen(),
                ),
              );
            },
            child: Text(
              "Kochi",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF4cb499),
      actions: [
        Image(
          image: const AssetImage(
            "assets/icons/mediezy logo small.png",
          ),
          height: 40.h,
          width: 100.w,
        ),
        const HorizontalSpacingWidget(width: 10)
      ],
    );
  }
}
