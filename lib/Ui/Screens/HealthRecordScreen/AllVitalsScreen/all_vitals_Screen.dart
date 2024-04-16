import 'package:flutter/material.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/vital_widget.dart';

class AllVitalsScreen extends StatefulWidget {
  const AllVitalsScreen({super.key});

  @override
  State<AllVitalsScreen> createState() => _AllVitalsScreenState();
}

class _AllVitalsScreenState extends State<AllVitalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          return VitalWidget();
        }),
      ),
    );
  }
}


