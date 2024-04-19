import 'package:flutter/material.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/QuestionnaireScreen/common_symptoms_screen.dart';

class HomeQuestinareWidget extends StatelessWidget {
  const HomeQuestinareWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CommonSymptomsScreen(),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset("assets/images/questinare_banner.jpg"),
      ),
    );
  }
}
