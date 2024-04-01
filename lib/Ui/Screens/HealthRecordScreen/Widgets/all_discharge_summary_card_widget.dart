import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/DeleteDocument/delete_document_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/EditDischargeSummaryScreen/edit_discharge_summary_screen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/ViewFileScreen/view_file_screen.dart';

class AllDischargeSummaryCardWidget extends StatelessWidget {
  const AllDischargeSummaryCardWidget(
      {super.key,
      required this.documentPath,
      required this.documentId,
      required this.patientId,
      required this.patientName,
      required this.recordDate,
      required this.doctorName,
      required this.hospitalName,
      required this.admittedFor,
      required this.updatedTime});

  final String documentPath;
  final String documentId;
  final String patientId;
  final String patientName;
  final String recordDate;
  final String doctorName;
  final String hospitalName;
  final String admittedFor;
  final String updatedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ViewFileScreen(
                    viewFile: documentPath.toString(),
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100.h,
                width: 80.w,
                decoration: BoxDecoration(
                  color: kScaffoldColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 30,
                      width: 30,
                      image: AssetImage(
                        'assets/icons/file view.png',
                      ),
                    ),
                    Text("View File")
                  ],
                ),
              ),
            ),
          ),
          const HorizontalSpacingWidget(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Details : ",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const HorizontalSpacingWidget(width: 130),
                  PopupMenuButton(
                    iconSize: 20.sp,
                    icon: Icon(
                      Icons.more_vert,
                      color: kMainColor,
                    ),
                    itemBuilder: (context) => <PopupMenuEntry<dynamic>>[
                      PopupMenuItem(
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditDischageSummaryScreen(
                                documentId: documentId,
                                patientId: patientId,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          BlocProvider.of<DeleteDocumentBloc>(context).add(
                            FetchDeletedDocument(
                                documentId: documentId, type: "3"),
                          );
                        },
                        child: Text(
                          "Delete",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Patient : ",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kSubTextColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    patientName,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Record Date : ",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kSubTextColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    recordDate,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Doctor name : ",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kSubTextColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Dr $doctorName",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Hospital name : ",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kSubTextColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    hospitalName,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Admitted for : ",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kSubTextColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    admittedFor,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Text(
                "Last updated - $updatedTime",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: kSubTextColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const VerticalSpacingWidget(height: 5),
            ],
          ),
        ],
      ),
    );
  }
}
