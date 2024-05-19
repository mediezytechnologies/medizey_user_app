import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AddDocumentScreen/add_document_screen.dart';

class AddDocumentsWidget extends StatelessWidget {
  const AddDocumentsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //! add prescription
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddDocumentScreen(
                    appBarTitle: "Upload Prescription",
                    type: 2,
                    stringType: "Prescription",
                    image: "assets/images/prescription_image.png",
                  ),
                ),
              );
            },
            child: FadedScaleAnimation(
              scaleDuration: const Duration(milliseconds: 400),
              fadeDuration: const Duration(milliseconds: 400),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Image(
                  image: AssetImage("assets/icons/add prescription.jpg"),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          const HorizontalSpacingWidget(width: 5),
          //!lab report
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddDocumentScreen(
                    appBarTitle: "Upload Lab Report",
                    type: 1,
                    stringType: "Lab report",
                  ),
                ),
              );
            },
            child: FadedScaleAnimation(
              scaleDuration: const Duration(milliseconds: 400),
              fadeDuration: const Duration(milliseconds: 400),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Image(
                  image: AssetImage("assets/icons/lab report.jpg"),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          const HorizontalSpacingWidget(width: 5),
          //!scan report
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddDocumentScreen(
                    appBarTitle: "Upload Scan Report",
                    type: 4,
                    stringType: "Scanning report",
                  ),
                ),
              );
            },
            child: FadedScaleAnimation(
              scaleDuration: const Duration(milliseconds: 400),
              fadeDuration: const Duration(milliseconds: 400),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Image(
                  image: AssetImage("assets/icons/scanning report.jpg"),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          const HorizontalSpacingWidget(width: 5),
          //! discharge summery
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddDocumentScreen(
                    appBarTitle: "Upload Discharge Summary",
                    type: 3,
                    stringType: "Discharge summary",
                  ),
                ),
              );
            },
            child: FadedScaleAnimation(
              scaleDuration: const Duration(milliseconds: 400),
              fadeDuration: const Duration(milliseconds: 400),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Image(
                  image: AssetImage("assets/icons/discharge report.jpg"),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
