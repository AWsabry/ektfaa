import 'package:ektfaa/Components/Constants/constatnts.dart';
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
  @override
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
                  Container(
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
                                const Text(
                                  "Upload your photo here",
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
                                  size:
                                      MediaQuery.of(context).size.height / 8.5,
                                ),
                                const Text(
                                  "File name:\n",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromRGBO(117, 117, 117, 1)),
                                )
                              ],
                            )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 90,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // controller: SignUpCubit.get(context).firstName,
                    decoration: InputDecoration(
                      labelText: EktfaaConstants.firstName,
                      labelStyle: const TextStyle(color: AppColors.grey),
                      hintText: EktfaaConstants.firstNameHint,
                      prefixIcon: const Icon(
                        Icons.person_outline,
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
                        return EktfaaConstants.firstNameHint;
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
                      labelText: EktfaaConstants.lastName,
                      labelStyle: const TextStyle(color: AppColors.grey),
                      hintText: EktfaaConstants.lastNameHint,
                      prefixIcon: const Icon(
                        Icons.person_outline,
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
                        return EktfaaConstants.lastNameHint;
                      }

                      // Return null if the entered email is valid
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    // controller: SignUpCubit.get(context).age,
                    decoration: InputDecoration(
                      labelText: EktfaaConstants.age,
                      labelStyle: const TextStyle(color: AppColors.grey),
                      hintText: EktfaaConstants.ageHint,
                      prefixIcon: const Icon(
                        Icons.person_outline,
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
                        return EktfaaConstants.ageHint;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    // controller: SignUpCubit.get(context).age,
                    decoration: InputDecoration(
                      labelText: EktfaaConstants.age,
                      labelStyle: const TextStyle(color: AppColors.grey),
                      hintText: EktfaaConstants.ageHint,
                      prefixIcon: const Icon(
                        Icons.person_outline,
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
                        return EktfaaConstants.ageHint;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // FormField(
                  //   validator: (value) {
                  //     if (!checker) {
                  //       return EktfaaConstants.termsHint;
                  //     } else {
                  //       return null;
                  //     }
                  //   },
                  //   builder: (state) {
                  //     return Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         InkWell(
                  //           onTap: () {
                  //             setState(() {
                  //               checker = !checker;
                  //             });
                  //           },
                  //           child: Row(
                  //             children: [
                  //               Checkbox(
                  //                 value: checker,
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     checker = !checker;

                  //                     state.didChange(value);
                  //                   });
                  //                 },
                  //               ),
                  //               const Text(
                  //                 'Agree to our privacy & policy',
                  //                 overflow: TextOverflow.ellipsis,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 8.0),
                  //           child: Text(
                  //             state.errorText ?? '',
                  //             style: const TextStyle(
                  //               color: Colors.red,
                  //             ),
                  //           ),
                  //         )
                  //       ],
                  //     );
                  //   },
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  SizedBox(
                    width: 500,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
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
