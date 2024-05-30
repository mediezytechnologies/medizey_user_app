// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';
import 'dart:math';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;

import 'package:mediezy_user/Model/GetAppointments/get_completed_appointments_model.dart';
import 'package:mediezy_user/Ui/CommonWidgets/row_text_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Consts/text_style.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/CompletedAppointmentDetailsScreen/widget/medicine_widget.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/CompletedAppointmentDetailsScreen/widget/vitals_widget.dart';

class AppColors {
  static const Color shadowColor = Color(0xFFe8e8e8);
  static const Color primaryColor = Color(0xFF13325b);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color greenColor = Color(0xFF4CAF50);
  static const Color redColor = Color(0xFFF44336);
}


class Results {
  static List results = [
    [
      'Anna Banana',
      'Registration: JS/23/1729',
      'assets/images/login image one.jpg',
      {
        'Maths': [80, 'A'],
        'English': [78, 'A-'],
        'Kiswahili': [87, 'A'],
        'Physics': [90, 'A'],
        'Biology': [92, 'A'],
        'Chemistry': [67, 'B'],
        'Geography': [78, 'A-'],
        'Spanish': [92, 'A'],
        'Total': [664, 'A'],
      }
    ],
    [
      'Adams Apple',
      'Registration: JS/23/1730',
      'assets/images/login image one.jpg',
      {
        'Maths': [87, 'A'],
        'English': [72, 'B+'],
        'Kiswahili': [77, 'A-'],
        'Physics': [86, 'A'],
        'Biology': [72, 'B+'],
        'Chemistry': [91, 'A'],
        'Geography': [79, 'A-'],
        'Spanish': [73, 'B+'],
        'Total': [637, 'A-'],
      }
    ],
    [
      'Lexi Lemon',
      'Registration: JS/23/1731',
      'assets/images/login image one.jpg',
      {
        'Maths': [80, 'A'],
        'English': [78, 'A-'],
        'Kiswahili': [87, 'A'],
        'Physics': [68, 'B'],
        'Biology': [71, 'B+'],
        'Chemistry': [67, 'B'],
        'Geography': [78, 'A-'],
        'Spanish': [88, 'A'],
        'Total': [617, 'A-'],
      }
    ],
    [
      'Paloma Pear',
      'Registration: JS/23/1732',
      'assets/images/login image one.jpg',
      {
        'Maths': [87, 'A'],
        'English': [93, 'A'],
        'Kiswahili': [77, 'A-'],
        'Physics': [86, 'A'],
        'Biology': [72, 'B+'],
        'Chemistry': [91, 'A'],
        'Geography': [83, 'A'],
        'Spanish': [88, 'A'],
        'Total': [677, 'A'],
      }
    ],
  ];
}



class PdfDemo extends StatefulWidget {
  const PdfDemo({super.key});

  @override
  State<PdfDemo> createState() => _PdfDemoState();
}

class _PdfDemoState extends State<PdfDemo> {
 
  List results = Results.results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 60,
        title: Text(
          'All Students',
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.headlineMedium,
            fontWeight: FontWeight.w400,
            fontSize: 22.0,
            color: AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.separated(
          itemCount: results.length,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (_) => StudentProfile(
                      studentName: results[index][0],
                      studentReg: results[index][1],
                      studentImage: results[index][2],
                      studentResults: results[index][3],
                    ),
                  ),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(results[index][2]),
                ),
                title: Text(
                  results[index][0],
                  style: const TextStyle(fontSize: 14),
                ),
                subtitle: Text(
                  results[index][1],
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
     
    );
  }

  
  


}







class StudentProfile extends StatefulWidget {
  const StudentProfile({
    super.key,
    required this.studentName,
    required this.studentReg,
    required this.studentImage,
    required this.studentResults,
  });

  final String studentName;
  final String studentReg;
  final String studentImage;
  final Map studentResults;

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        foregroundColor: AppColors.whiteColor,
        toolbarHeight: 60,
        title: Text(
          widget.studentName,
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.headlineMedium,
            fontWeight: FontWeight.w400,
            fontSize: 22.0,
            color: AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  minRadius: 35.0,
                  backgroundImage: AssetImage(widget.studentImage),
                ),
                const SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16.0),
                    Text(
                      widget.studentName,
                      style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.studentReg,
                      style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            DataTable(
              columns: [
                DataColumn(
                  label: Text(
                    'Subject',
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Marks',
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Grade',
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
              rows: [
                // maths
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Maths',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Maths'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Maths'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // english
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'English',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['English'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['English'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // kiswahili
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Kiswahili',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Kiswahili'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Kiswahili'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // physics
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Physics',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Physics'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Physics'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // biology
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Biology',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Biology'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Biology'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // chemistry
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Chemistry',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Chemistry'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Chemistry'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // geography
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Geography',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Geography'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Geography'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // spanish
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        'Spanish',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Spanish'][0].toString(),
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.studentResults['Spanish'][1],
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Grand Total: ${widget.studentResults['Total'][0]}',
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  'Mean Grade: ${widget.studentResults['Total'][1]}',
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: _pdfFAB(),
    );
  }

  Widget _pdfFAB() {
    return FloatingActionButton(
      onPressed: () {
        downloadPDFDialog(context);
      },
      backgroundColor: AppColors.redColor,
      child: const Icon(
        CupertinoIcons.printer_fill,
        color: AppColors.whiteColor,
      ),
    );
  }

  void downloadPDFDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('You are about to generate the report form for ${widget.studentName}. Proceed?'),
        //content: const Text('Proceed?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              generateAndSavePDF();
              Navigator.of(context).pop();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  Future<void> generateAndSavePDF() async {
    final image = await imageFromAssetBundle('assets/images/login image one.jpg'); // import 'package:printing/printing.dart'
    final doc = pw.Document(); // import 'package:pdf/widgets.dart' as pw
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(18.00),
            child: pw.Column(
              children: [
                pw.Align(
                  alignment: pw.Alignment.topCenter,
                  child: pw.Image(image, width: 100, height: 100), // our school logo for the official PDF
                ),
                pw.Text(
                  'Jackie & Co. Secondary School',
                  style: const pw.TextStyle(fontSize: 17.00),
                ),
                pw.SizedBox(height: 10.00),
                pw.Align(
                  alignment: pw.Alignment.topLeft,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'Name: ${widget.studentName}',
                        style: const pw.TextStyle(fontSize: 15.00),
                      ),
                      pw.Text(
                        'Form 4 West',
                        style: const pw.TextStyle(fontSize: 15.00),
                      ),
                    ],
                  ),
                ),
                pw.Divider(),
                pw.SizedBox(height: 15.00),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Subject',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.SizedBox(height: 5.00),
                        pw.Text(
                          'Maths',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          'English',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          'Kiswahili',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          'Physics',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          'Biology',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          'Chemistry',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          'Geography',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          'Spanish',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Marks',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.SizedBox(height: 5.00),
                        pw.Text(
                          widget.studentResults['Maths'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['English'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Kiswahili'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Physics'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Biology'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Chemistry'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Geography'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Spanish'][0].toString(),
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Grade',
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.SizedBox(height: 5.00),
                        pw.Text(
                          widget.studentResults['Maths'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['English'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Kiswahili'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Physics'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Biology'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Chemistry'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Geography'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                        pw.Text(
                          widget.studentResults['Spanish'][1],
                          style: const pw.TextStyle(fontSize: 15.00),
                        ),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 30.00),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      'Grand Total: ${widget.studentResults['Total'][0]}',
                    ),
                    pw.SizedBox(width: 15),
                    pw.Text(
                      'Mean Grade: ${widget.studentResults['Total'][1]}',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
  }
}

   
const PdfColor gray = PdfColor.fromInt(0xFF7C7C7C);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);

class PdfDownloadButton extends StatelessWidget {
  const PdfDownloadButton({
    Key? key,
    required this.doctorName,
    required this.doctorImage,
    required this.clinicName,
    required this.symptoms,
    required this.tokenDate,
    required this.tokenTime,
    required this.patientName,
    required this.note,
    required this.labTestName,
    required this.labName,
    required this.prescriptionImage,
    required this.prescriptions,
    required this.reviewAfter,
    required this.vitals,
    required this.scanningCenterName,
    required this.scanningTestName,
    required this.whenItStart,
    required this.whenItsCome,
    required this.height,
    required this.weight,
    required this.heartRate,
    required this.temperature,
    required this.temperatureType,
    required this.spo2,
    required this.sys,
    required this.dia,
  }) : super(key: key);

  final String doctorName;
  final String doctorImage;
  final String clinicName;
  final String symptoms;
  final String tokenDate;
  final String tokenTime;
  final String patientName;
  final String note;
  final String labTestName;
  final String labName;
  final String prescriptionImage;
  final List<DoctorMedicines> prescriptions;
  final String reviewAfter;
  final List<Vitals> vitals;
  final String scanningCenterName;
  final String scanningTestName;
  final String whenItStart;
  final String whenItsCome;
   final String height;
  final String weight;
  final String heartRate;
  final String temperature;
  final String temperatureType;
  final String spo2;
  final String sys;
  final String dia;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          generateAndSavePDF(size);
        },
        child: CircleAvatar(
          radius: 15.r,
          backgroundColor: kMainColor,
          child: Icon(
            CupertinoIcons.printer_fill,
            color: AppColors.whiteColor,
            size: 15.sp,
          ),
        ),
      ),
    );
  }

  Future<void> generateAndSavePDF(Size size) async {
    final image = await imageFromAssetBundle(doctorImage);
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: pw.EdgeInsets.symmetric(horizontal: 8.w),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  children: [
                    pw.Image(
                      image,
                      height: size.height * .15,
                      width: size.width * .2,
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(left: 15.w),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                        children: [
                          pw.SizedBox(
                            width: size.width * .5,
                            child: pw.Text(
                              "Dr $doctorName",
                              maxLines: 1,
                              style: pw.Theme.of(context)
                                  .defaultTextStyle
                                  .copyWith(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 14.sp),
                            ),
                          ),
                          pw.SizedBox(
                            width: size.width * .5,
                            child: pw.Text(
                              clinicName,
                              maxLines: 1,
                              style: pw.Theme.of(context)
                                  .defaultTextStyle
                                  .copyWith(
                                      fontWeight: pw.FontWeight.bold,
                                      color: gray,
                                      fontSize: 12.sp),
                            ),
                          ),
                          pw.SizedBox(height: 5),
                          pw.Row(
                            children: [
                              pw.Row(
                                children: [
                                  pw.Text("$tokenDate | ",
                                      style: pw.Theme.of(context)
                                          .defaultTextStyle
                                          .copyWith(
                                              fontWeight: pw.FontWeight.bold,
                                              color: gray,
                                              fontSize: 12.sp)),
                                  pw.Text(tokenTime,
                                      style: pw.Theme.of(context)
                                          .defaultTextStyle
                                          .copyWith(
                                              fontWeight: pw.FontWeight.bold,
                                              color: gray,
                                              fontSize: 12.sp)),
                                ],
                              ),
                            ],
                          ),
                          pw.SizedBox(height: 5),
                          pw.Row(
                            children: [
                              pw.Text("For: ",
                                  style: pw.Theme.of(context)
                                      .defaultTextStyle
                                      .copyWith(
                                          fontWeight: pw.FontWeight.bold,
                                          color: gray,
                                          fontSize: 12.sp)),
                              pw.SizedBox(
                                width: size.width * .55,
                                child: pw.Text(
                                  patientName,
                                  maxLines: 1,
                                  style: pw.Theme.of(context)
                                      .defaultTextStyle
                                      .copyWith(
                                          fontWeight: pw.FontWeight.bold,
                                          color: gray,
                                          fontSize: 12.sp),
                                ),
                              ),
                            ],
                          ),
                          pw.SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ],
                ),
                pw.Text("Additional Details",
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(
                            fontWeight: pw.FontWeight.bold,
                            color: gray,
                            fontSize: 12.sp)),
                pw.SizedBox(height: 5),
                pw.Row(
                  children: [
                    pw.Text("Appointment for: ",
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(
                                fontWeight: pw.FontWeight.bold,
                                color: gray,
                                fontSize: 12.sp)),
                    pw.SizedBox(
                      width: size.width * .5,
                      child: pw.Text(
                        symptoms,
                        maxLines: 1,
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(
                                fontWeight: pw.FontWeight.bold,
                                color: gray,
                                fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 5),
                reviewAfter.isEmpty
                    ? pw.Container()
                    : pw.Column(
                        children: [
                          pw.Row(
                  children: [
                    pw.Text("Review after : ",
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(
                                fontWeight: pw.FontWeight.bold,
                                color: gray,
                                fontSize: 12.sp)),
                    pw.SizedBox(
                      width: size.width * .5,
                      child: pw.Text(
                       '$reviewAfter days',
                        maxLines: 1,
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(
                                fontWeight: pw.FontWeight.bold,
                                color: gray,
                                fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),

 pw.SizedBox(height: 5),


                        
                         
                        ],
                      ),
                whenItStart.isEmpty
                    ? pw.Container()
                    : pw.Column(
                        children: [

                            pw.Row(
                  children: [
                    pw.Text("When did it start",
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(
                                fontWeight: pw.FontWeight.bold,
                                color: gray,
                                fontSize: 12.sp)),
                    pw.SizedBox(
                      width: size.width * .5,
                      child: pw.Text(
                     whenItsCome,
                        maxLines: 1,
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(
                                fontWeight: pw.FontWeight.bold,
                                color: gray,
                                fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),

 pw.SizedBox(height: 5),







                         
                        ],
                      ),
                whenItsCome.isEmpty
                    ? pw.Container()
                    : pw.Column(
                        children: [

                           pw.Row(
                  children: [
                    pw.Text("Intensity",
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(
                                fontWeight: pw.FontWeight.bold,
                                color: gray,
                                fontSize: 12.sp)),
                    pw.SizedBox(
                      width: size.width * .5,
                      child: pw.Text(
                  whenItStart,
                        maxLines: 1,
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(
                                fontWeight: pw.FontWeight.bold,
                                color: gray,
                                fontSize: 13.sp),
                      ),
                    ),
                  ],
                ),

 pw.SizedBox(height: 5),



                         
                        ],
                      ),
                vitals.isNotEmpty
                    ? pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("Vitals: ", style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(
                                fontWeight: pw.FontWeight.bold,
                                color: gray,
                                fontSize: 13.sp),
                      pw.SizedBox(height: 5),
                      
ListView.builder(
                            itemCount: vitals.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: kCardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              height.isEmpty
                  ? const SizedBox()
                  : Row(
                      children: [
                        pw.Row(
                  children: [
                    pw.Text("Intensity",
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(
                                fontWeight: pw.FontWeight.bold,
                                color: gray,
                                fontSize: 12.sp)),
                    pw.SizedBox(
                      width: size.width * .5,
                      child: pw.Text(
                  whenItStart,
                        maxLines: 1,
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(
                                fontWeight: pw.FontWeight.bold,
                                color: gray,
                                fontSize: 13.sp),
                      ),
                    ),
                  ],
                ),

 pw.SizedBox(height: 5),
                      ],
                    ),
              weight == 'null'
                  ? const SizedBox()
                  : Row(
                      children: [
                        pw.Row(
                  children: [
                    pw.Text("Intensity",
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(
                                fontWeight: pw.FontWeight.bold,
                                color: gray,
                                fontSize: 12.sp)),
                    pw.SizedBox(
                      width: size.width * .5,
                      child: pw.Text(
                  whenItStart,
                        maxLines: 1,
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(
                                fontWeight: pw.FontWeight.bold,
                                color: gray,
                                fontSize: 13.sp),
                      ),
                    ),
                  ],
                ),

 pw.SizedBox(height: 5),
                      ],
                    ),
              heartRate == 'null'
                  ? const SizedBox()
                  : VitalsRowTextWidget(
                      heading: "Heartrate",
                      data: "$heartRate BPM",
                    ),
            ],
          ),
          const VerticalSpacingWidget(height: 5),
          Row(
            children: [
              temperature == 'null'
                  ? const SizedBox()
                  : Row(
                      children: [
                        VitalsRowTextWidget(
                          heading: "Temperature",
                          data: "$temperature $temperatureType",
                        ),
                        const HorizontalSpacingWidget(width: 5),
                      ],
                    ),
              spo2 == 'null'
                  ? const SizedBox()
                  : Row(
                      children: [
                        VitalsRowTextWidget(
                          heading: "Temperature",
                          data: "$spo2 %",
                        ),
                        const HorizontalSpacingWidget(width: 5),
                      ],
                    ),
              sys == 'null' && dia == 'null'
                  ? const SizedBox()
                  : VitalsRowTextWidget(
                      heading: "BP",
                      data: "$sys / $dia",
                    ),
            ],
          ),
        ],
      ),
    )
                              
                              
                              
                              
                              
                              
                             



               }       )


                          )
                      
                         // ...vitals.map((vital) ).toList(),
                        ],
                      )
                    : pw.Container(),
                prescriptions.isNotEmpty
                    ? pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("Medicines: ", style: black13B500),
                          VerticalSpacingWidget(height: 5),
                          ...prescriptions.map((prescription) {
                            return MedicineWidget(
                              medicalStoreName:
                                  prescription.medicalStoreName.toString(),
                              medicineName:
                                  prescription.medicineName.toString(),
                              dosage: prescription.dosage.toString(),
                              interval: prescription.interval.toString(),
                              intervalSection:
                                  prescription.timeSection.toString(),
                              noOfDays: prescription.noOfDays.toString(),
                              morning: prescription.morning!,
                              noon: prescription.noon!,
                              evening: prescription.evening!,
                              night: prescription.night!,
                              foodType: prescription.type!,
                            );
                          }).toList(),
                        ],
                      )
                    : pw.Container(),
                labTestName.isEmpty
                    ? pw.Container()
                    : pw.Column(
                        children: [
                          RowTextWidget(heading: "Lab test", data: labTestName),
                          VerticalSpacingWidget(height: 5),
                        ],
                      ),
                labName.isEmpty
                    ? pw.Container()
                    : pw.Column(
                        children: [
                          RowTextWidget(heading: "Lab name", data: labName),
                          VerticalSpacingWidget(height: 5),
                        ],
                      ),
                note.isEmpty
                    ? pw.Container()
                    : pw.Column(
                        children: [
                          RowTextWidget(heading: "Note", data: note),
                          VerticalSpacingWidget(height: 5),
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }
}
