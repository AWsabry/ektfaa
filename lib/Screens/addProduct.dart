import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Components/Navigation/custom_navigate.dart';
import 'package:ektfaa/Screens/thankYouScreen.dart';
import 'package:ektfaa/Theme.dart';
import 'package:ektfaa/features/Search/ProductsCubit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  XFile? _image;
  // Function to open the image picker
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }

  void clearImage() {
    setState(() {
      _image = null;
    });
  }

  List<String> tags = [];

  void addTag(String tag) {
    setState(() {
      tags.add(tag);
      ProductsCubit.get(context).tagsController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back icon
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            EktfaaConstants.uploadProductTitle,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Form(
        key: ProductsCubit.get(context).uploadProductFormKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      // Show a modal bottom sheet with options to take a photo or select from gallery
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: const Icon(Icons.camera),
                                  title: const Text('Take a Photo'),
                                  onTap: () {
                                    _pickImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.photo),
                                  title: const Text('Choose from Gallery'),
                                  onTap: () {
                                    _pickImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 171,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        // color: const Color.fromRGBO(41, 41, 41, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: _image == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Image.asset("assets/Images/image.png"),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "Upload your photo here (Optional)",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                  ),
                                )
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.insert_drive_file_outlined,
                                  color: const Color.fromRGBO(117, 117, 117, 1),
                                  size: MediaQuery.of(context).size.height / 10,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "File name:\n${_image!.name}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontSize: 8,
                                        color:
                                            Color.fromRGBO(117, 117, 117, 1)),
                                  ),
                                ),
                                if (_image != null)
                                  IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: clearImage,
                                  ),
                              ],
                            ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 90,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // controller: SignUpCubit.get(context).firstName,
                    decoration: InputDecoration(
                      labelText: EktfaaConstants.productEnglishName,
                      labelStyle:
                          const TextStyle(color: AppColors.grey, fontSize: 12),
                      hintStyle: const TextStyle(
                        fontSize: 12, // Adjust the font size as needed
                      ),
                      hintText: EktfaaConstants.productEnglishName,
                      prefixIcon: const Icon(
                        Icons.language,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return EktfaaConstants.productEnglishNameHint;
                      }

                      // Return null if the entered email is valid
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // controller: SignUpCubit.get(context).lastName,
                    decoration: InputDecoration(
                      labelText: EktfaaConstants.productArabicName,
                      labelStyle:
                          const TextStyle(color: AppColors.grey, fontSize: 12),
                      hintStyle: const TextStyle(
                        fontSize: 12, // Adjust the font size as needed
                      ),
                      hintText: EktfaaConstants.productArabicName,
                      prefixIcon: const Icon(
                        Icons.language,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return EktfaaConstants.productArabicNameHint;
                      }

                      // Return null if the entered email is valid
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // controller: SignUpCubit.get(context).lastName,
                    decoration: InputDecoration(
                      labelText: EktfaaConstants.link,
                      labelStyle:
                          const TextStyle(color: AppColors.grey, fontSize: 12),
                      hintStyle: const TextStyle(
                        fontSize: 12, // Adjust the font size as needed
                      ),
                      hintText: EktfaaConstants.link,
                      prefixIcon: const Icon(
                        Icons.link,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // controller: SignUpCubit.get(context).lastName,
                    decoration: InputDecoration(
                      labelText: EktfaaConstants.vendor,
                      labelStyle:
                          const TextStyle(color: AppColors.grey, fontSize: 12),
                      hintStyle: const TextStyle(
                        fontSize: 12, // Adjust the font size as needed
                      ),
                      hintText: EktfaaConstants.vendor,
                      prefixIcon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // controller: SignUpCubit.get(context).lastName,
                    decoration: InputDecoration(
                      labelText: EktfaaConstants.companyName,
                      labelStyle:
                          const TextStyle(color: AppColors.grey, fontSize: 12),
                      hintStyle: const TextStyle(
                        fontSize: 12, // Adjust the font size as needed
                      ),
                      hintText: EktfaaConstants.companyName,
                      prefixIcon: const Icon(
                        Icons.apartment,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: ProductsCubit.get(context).tagsController,
                    decoration: InputDecoration(
                      labelText: EktfaaConstants.tags,
                      labelStyle:
                          const TextStyle(color: AppColors.grey, fontSize: 12),
                      hintStyle: const TextStyle(
                        fontSize: 12, // Adjust the font size as needed
                      ),
                      hintText: EktfaaConstants.tagsHint,
                      prefixIcon: const Icon(
                        Icons.tag_sharp,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: (value) {
                      if (tags.length < 2) {
                        return EktfaaConstants.tagsError;
                      }

                      // Return null if the entered email is valid
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      if (value.isEmpty || tags.length < 2) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(EktfaaConstants.tagsError)));
                      }
                      if (tags.length <= 5) {
                        addTag(value);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(EktfaaConstants.tagsSnakeBar)));
                        ProductsCubit.get(context).tagsController.clear();
                      }

                      print(tags);
                    },
                  ),
                  Wrap(
                    children: tags.map((tag) {
                      return Chip(
                        label: Text(tag),
                        onDeleted: () {
                          setState(() {
                            tags.remove(tag);
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    maxLines: 5,
                    // controller: SignUpCubit.get(context).lastName,
                    decoration: InputDecoration(
                      labelText: EktfaaConstants.description,
                      labelStyle:
                          const TextStyle(color: AppColors.grey, fontSize: 12),
                      hintStyle: const TextStyle(
                        fontSize: 12, // Adjust the font size as needed
                      ),
                      hintText: EktfaaConstants.descriptionHint,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 500,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (ProductsCubit.get(context)
                            .uploadProductFormKey
                            .currentState!
                            .validate()) {
                          pushAndRemoved(context, const ThankYou());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redAccent,
                      ),
                      child: Text(EktfaaConstants.uploadProduct),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
