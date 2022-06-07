import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_news/data/main_news_item_dao.dart';
import 'package:flutter_news/managers/app_state_manager.dart';
import 'package:flutter_news/models/main_news_model/main_news_model.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class UploadNewsForm extends StatefulWidget {
  const UploadNewsForm({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadNewsForm> createState() => _UploadNewsFormState();
}

class _UploadNewsFormState extends State<UploadNewsForm> {
  File? image;
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'Title',
                      decoration: InputDecoration(hintText: 'Title'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.max(70),
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderChoiceChip(
                      name: 'Category',
                      options: [
                        FormBuilderFieldOption(
                          value: 'sports',
                          child: Text("Sports"),
                        ),
                        FormBuilderFieldOption(
                          value: 'fashion',
                          child: Text("Fashion"),
                        ),
                        FormBuilderFieldOption(
                          value: 'finance',
                          child: Text("Finance"),
                        )
                      ],
                      spacing: 10,
                      validator: FormBuilderValidators.required(),
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                    FormBuilderTextField(
                      name: 'Publisher',
                      decoration: InputDecoration(hintText: 'Publisher'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'Description',
                      decoration: InputDecoration(hintText: 'Description'),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      minLines: 8,
                    )
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => pickImage(ImageSource.gallery),
                child: Text('Pick gallery')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () => pickImage(ImageSource.camera),
                child: Text('Pick camera')),
            SizedBox(
              height: 10,
            ),
            image != null
                ? ClipRRect(
                    child: Image.file(
                      image!,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)))
                : Container(
                    color: Colors.white,
                    child: Text('some image'),
                    alignment: Alignment.center,
                    width: 150,
                    height: 150,
                  ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  final itemManager =
                      Provider.of<MainNewsDAO>(context, listen: false);

                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // print(_formKey.currentState!.value);
                    final String title = _formKey.currentState!.value['Title'];
                    final String category =
                        _formKey.currentState!.value['Category'];
                    final String publisher =
                        _formKey.currentState!.value['Publisher'];
                    final String description =
                        _formKey.currentState!.value['Description'];

                    final imageUrl = itemManager.uploadImage(image);
                    imageUrl
                        .then((value) => {
                              //put image in the model
                              MainNewsModel(
                                  imageUrl: value,
                                  title: title,
                                  category: category,
                                  publisher: publisher,
                                  description: description,
                                  date: DateTime.now())
                            })
                        .then((item) => itemManager
                            .saveNewsItem(// add to collection "MainItem"
                                item.single)); //use single for just one element

                    //kprint(' Doenload url = $imageUrl');
                  }
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final imageFile = await ImagePicker().pickImage(source: source);
      if (imageFile == null) {
        return;
      }
      final imageTemporary = File(imageFile.path);
      setState(() {
        image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
