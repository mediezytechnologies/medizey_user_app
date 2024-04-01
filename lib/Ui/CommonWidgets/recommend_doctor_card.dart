import 'package:flutter/material.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/RecommendDoctorScreen/recommend_doctor_screen.dart';

class RecommendedDoctorCard extends StatelessWidget {
  const RecommendedDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const RecommendedDoctorScreen()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const Image(
          image: AssetImage("assets/images/recommend.jpg"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
