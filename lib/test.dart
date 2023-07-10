import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

// import '../../providers/auth.dart';
// import '../../providers/post_provider.dart';

class ServiceProviderAddPostScreen extends StatefulWidget {
  const ServiceProviderAddPostScreen({super.key});
  static const routeName = '/AddPostScreen';

  @override
  State<ServiceProviderAddPostScreen> createState() =>
      _ServiceProviderAddPostScreenState();
}

class _ServiceProviderAddPostScreenState
    extends State<ServiceProviderAddPostScreen> {
  var serviceProviderPostDetails = {
    'postImagePath': '',
    'postCaption': '',
    'userId': ''
  };

  final _formKey = GlobalKey<FormState>();
  FocusNode focusPostCaptionNode = FocusNode();
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var userId = Provider.of(context, listen: false).userId;
    serviceProviderPostDetails['userId'] = userId!;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Add Post"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Column(children: [
                const SizedBox(height: 60),
                Container(
                  child: imageProfile(),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  focusNode: focusPostCaptionNode,
                  autovalidateMode: focusPostCaptionNode.hasFocus
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  onSaved: (value) {
                    serviceProviderPostDetails['postCaption'] = value!;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter caption',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          serviceProviderPostDetails['postImagePath'] != '') {
                        _formKey.currentState!.save();
                        debugPrint("---------$serviceProviderPostDetails");
                      }

                      Provider.of(context, listen: false)
                          .addPost(serviceProviderPostDetails);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                  //    backgroundColor: Theme.of(context).accentColor,
                    ),
                    child: const Text("Post",
                        style: TextStyle(color: Color.fromRGBO(10, 25, 49, 1))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget addImage() {
    return Container(
        height: 125, // MediaQuery.of(context).size.height,
        width: 500, // MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            const Text("Choose image"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color.fromRGBO(10, 25, 49, 1))),
                    onPressed: () {
                      takePhoto(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("Camera")),
                const SizedBox(
                  width: 50,
                ),
                ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color.fromRGBO(10, 25, 49, 1))),
                    onPressed: () {
                      takePhoto(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("Gallery")),
              ],
            )
          ],
        ));
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 1.15,
            width: MediaQuery.of(context).size.width / 1.15,
            child: _imageFile == null
                ? Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 211, 209, 209)),
                    child: const Center(child: Icon(Icons.image_search)),
                  )
                : Image.file(File(_imageFile!.path)),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width / 1.15,
            child: Builder(
                builder: (context) => InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((context) => addImage()),
                          isDismissible: true,
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(10, 25, 49, 1)),
                        child: const Icon(Icons.camera_alt_rounded,
                            color: Colors.white, size: 28),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    XFile? file = await _picker.pickImage(source: source);
    if (file == null) {
      Navigator.pop(context);
    } else {
      if (mounted) {
        CroppedFile? croppedImage = await ImageCropper().cropImage(
          sourcePath: file.path,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          aspectRatioPresets: [CropAspectRatioPreset.square],
        );
        setState(() {
          if (croppedImage == null) {
            Navigator.pop(context);
          } else {
            _imageFile = XFile(croppedImage.path);
            serviceProviderPostDetails['postImagePath'] = _imageFile!.path;
            Navigator.pop(context);
          }
        });
      }
    }
  }
}