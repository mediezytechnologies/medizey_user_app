import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../../../../CommonWidgets/horizontal_spacing_widget.dart';
import '../../../../CommonWidgets/location_card_widget.dart';
import '../../../../Consts/text_style.dart';
import '../../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../../Consts/app_colors.dart';

class DoctorDetailsThirdWidget extends StatelessWidget {
  const DoctorDetailsThirdWidget({
    super.key,
    required this.clinicName,
    required this.startTime,
    required this.endTime,
    required this.address,
    required this.location,
    required this.availableTokenCount,
    required this.totalTokenCount,
    required this.nextDateAvailableTokenTime,
    required this.nextAvailableTokenTime,
    required this.distanceFromUser,
    required this.consultationFee,
    required this.isOnLeave,
  });

  final String clinicName;
  final String startTime;
  final String endTime;
  final String address;
  final String location;
  final int availableTokenCount;
  final int totalTokenCount;
  final String nextDateAvailableTokenTime;
  final String nextAvailableTokenTime;
  final String distanceFromUser;
  final String consultationFee;
  final int isOnLeave;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(clinicName, style: black13B500),
        startTime == 'null' || isOnLeave == 1
            ? const SizedBox()
            : Row(
                children: [
                  Text("Availibility: ", style: grey11B400),
                  Text(startTime, style: black12B500),
                  Text(" - $endTime", style: black12B500),
                ],
              ),
        const VerticalSpacingWidget(height: 2),
        Text("Address: ", style: grey11B400),
        SizedBox(
          width: size.width * .95,
          child: Text(address,
              style: black12B500, maxLines: 3, overflow: TextOverflow.ellipsis),
        ),
        const VerticalSpacingWidget(height: 2),
        Text("Location: ", style: grey11B400),
        SizedBox(
          width: size.width * .95,
          child: Text(location,
              style: black12B500, maxLines: 3, overflow: TextOverflow.ellipsis),
        ),
        const VerticalSpacingWidget(height: 2),
        Row(
          children: [
            Text("Consultation fee : ", style: grey11B400),
            Text("₹ $consultationFee", style: black12B500),
          ],
        ),
        const VerticalSpacingWidget(height: 2),
        availableTokenCount == 0 || isOnLeave == 1
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Available tokens : ", style: grey11B400),
                      Text(availableTokenCount.toString(), style: black12B500),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 2),
                ],
              ),
        totalTokenCount == 0 || isOnLeave == 1
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Total tokens : ", style: grey11B400),
                      Text(totalTokenCount.toString(), style: black12B500),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 2),
                ],
              ),
        availableTokenCount == 0 || isOnLeave == 1
            ? nextDateAvailableTokenTime == "null" 
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Next available token : ", style: grey11B400),
                          Text(nextDateAvailableTokenTime, style: black12B500),
                        ],
                      ),
                      const VerticalSpacingWidget(height: 2),
                    ],
                  )
            : nextAvailableTokenTime == "null" || isOnLeave == 1
                ? const SizedBox()
                : Row(
                    children: [
                      Text("Next available token : ", style: grey11B400),
                      Text("$nextAvailableTokenTime Today", style: black12B500),
                    ],
                  ),
        const VerticalSpacingWidget(height: 2),
        Row(
          children: [
            distanceFromUser == 'null'
                ? const SizedBox()
                : Row(
                    children: [
                      Text("$distanceFromUser away", style: black12B500),
                      const HorizontalSpacingWidget(width: 80),
                    ],
                  ),
            GestureDetector(
                onTap: () {
                  MapsLauncher.launchQuery(address);
                },
                child: LocationCardWidget(color: kMainColor)),
          ],
        ),
      ],
    );
  }
}
