import 'package:bobde6_multi_web_admin/views/screens/side_bar_screens/widgets/banner_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UploadBannersScreen extends StatefulWidget {
  static const String routeName = '\UploadBannersScreen';

  @override
  State<UploadBannersScreen> createState() => _UploadBannersScreenState();
}

class _UploadBannersScreenState extends State<UploadBannersScreen> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  dynamic _image;

  String? fileName;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    }
  }

  _uploadBannersToStorage(dynamic image) async {
    Reference ref = _storage.ref().child('Banners').child(fileName!);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadToFireStore() async {
    EasyLoading.show();
    if (_image != null) {
      String imageUrl = await _uploadBannersToStorage(_image);
      _firestore.collection('banners').doc(fileName).set({
        'image': imageUrl,
      }).whenComplete(() {
        EasyLoading.dismiss();
      });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              'Banners',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
          ),
          Divider(
            color: Colors.greenAccent,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        border: Border.all(
                          color: Colors.grey.shade800,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _image != null
                          ? Image.memory(_image, fit: BoxFit.cover)
                          : Center(
                              child: Text('Banners'),
                            ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        pickImage();
                      },
                      child: Text(
                        'Upload Image',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  uploadToFireStore();
                },
                child: Text(
                  'save',
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
                child: Text(
              'Banners',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          BannerWidget(),
        ],
      ),
    );
  }
}
