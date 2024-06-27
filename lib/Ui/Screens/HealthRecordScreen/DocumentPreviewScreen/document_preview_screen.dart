import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/HealthRecord/UploadDocumentModel/upload_document_model.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/UploadDocument/UploadDocument/upload_document_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/SaveDocumentScreen/save_document_screen.dart';
import '../../../Consts/text_style.dart';

class DocumentPreviewScreen extends StatefulWidget {
  final File? imageFile;
  final String? imageUrl;
  final int type;

  const DocumentPreviewScreen(
      {Key? key, this.imageFile, this.imageUrl, required this.type})
      : super(key: key);

  @override
  State<DocumentPreviewScreen> createState() => _DocumentPreviewScreenState();
}

class _DocumentPreviewScreenState extends State<DocumentPreviewScreen> {
  late UpLoadDocumentModel upLoadDocumentModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Preview'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (widget.imageFile != null)
                Image.file(
                  widget.imageFile!,
                  height: 500,
                  width: 500,
                )
              else if (widget.imageUrl != null)
                Image.network(
                  widget.imageUrl!,
                  height: 500,
                  width: 500,
                )
              else
                const Text('No Image Selected'),
              const VerticalSpacingWidget(height: 20),
              BlocConsumer<UploadDocumentBloc, UploadDocumentState>(
                listener: (context, state) {
                  if (state is UploadDocumentError) {
                    const Center(
                      child: Text("Something Went Wrong"),
                    );
                  }
                  if (state is UploadDocumentLoaded) {
                    upLoadDocumentModel =
                        BlocProvider.of<UploadDocumentBloc>(context)
                            .uploadDocumentModel;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DocumentSaveScreen(
                          type: widget.type,
                          documentId:
                              upLoadDocumentModel.document!.id.toString(),
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return CommonButtonWidget(
                    widget: state is UploadDocumentLoading
                        ? CircularProgressIndicator(
                            color: kCardColor,
                          )
                        : Text("Upload", style: white13B700),
                    onTapFunction: () {
                      BlocProvider.of<UploadDocumentBloc>(context).add(
                          FetchUploadDocuments(document: widget.imageFile!));
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
