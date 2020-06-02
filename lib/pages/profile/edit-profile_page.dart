import 'dart:io';


import 'package:apni_sawari/Widgets/custom-datepicker.dart';
import 'package:apni_sawari/auth/userData.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(0.0, 15.0),
                      blurRadius: 15.0),
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, -10.0),
                      blurRadius: 10.0),
                ]),
            child: EditFields(),
          ),
        ),
      ),
    );
  }
}

class EditFields extends StatefulWidget {
  @override
  _EditFieldsState createState() => _EditFieldsState();
}

class _EditFieldsState extends State<EditFields> {

  Map<String, String> image = Map();

  var _key = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool obscurePassword = true;

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _genders = <String>['Male', 'Female'];

  String selectedGender;
  DateTime _dob;





  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      autovalidate: _autoValidate,
      child: Column(children: <Widget>[

        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child:  Stack(fit: StackFit.loose, children: <Widget>[
             Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Container(
                    width: 140.0,
                    height: 140.0,
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue)
                    ),
                 child: image.length==0 ? ClipRRect(
                   borderRadius: BorderRadius.circular(100),
                   child: Image.network(
                         userImageUrl,),
                 ) : ClipRRect(
                   borderRadius: BorderRadius.circular(100),
                   child: Image.file(
                       File(image.values.first),
                       fit: BoxFit.cover,
                     ),
                 ),
                 ),
              ],
            ), InkWell(
                onTap: () async {
                  Map<String, String> tempImage;
                  try {
                    tempImage = await FilePicker.getMultiFilePath(
                        type: FileType.IMAGE, fileExtension: '');
                  } on PlatformException catch (e) {
                    print(e.message);
                    // Message Display.
                  }
                  if (mounted) setState(() {
                    image.clear();
                   image.addAll(tempImage);
                  });
                  print(image.values);
                },
                child: Padding(
                    padding: EdgeInsets.only(top: 90.0, right: 100.0),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 25.0,
                          child:  Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
            ),
          ]),
        ),

        SizedBox(height: 10,),

        _buildTextField(context, _name, "Full Name*"),
        _buildTextField(context, _email, "Email*"),
        _buildTextField(context, _phone, "Phone*"),
        _buildTextField(context, _password, "Update Password"),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DatePickerField(
            title: "Date Of Birth",
            onChanged: (date) {
              _dob = date;
            },
          ),
        ),

        SizedBox(
          height: 40,
          child: RaisedButton(
            child: Text("Update",style: TextStyle(color: Colors.white),),
            onPressed: () async {
              FocusScope.of(context).unfocus();
              if(_key.currentState.validate()){


              }else{
                setState(() {
                  _autoValidate=true;
                });
              }


            },
            color: Colors.blue,
            shape: StadiumBorder(),
          ),
        ),
        SizedBox(height: 20,),
      ],),
    );
  }

  _buildTextField(
      context,
      textFieldController,
      labelText,
      ) =>
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            inputFormatters: labelText == 'Phone*' ?  [WhitelistingTextInputFormatter.digitsOnly] : null,
            validator: (value){
              if(labelText=='Update Password'){
                return null;
              }
              if(value.isEmpty){
                return 'Please enter $labelText';
              }
              if(labelText=='Email*' && !value.contains("@")){
                return 'Email must have "@"';
              }
              return null;
            },
            obscureText: (labelText=='Update Password') ? obscurePassword : false,
            controller: textFieldController,
            keyboardType: labelText == 'Email*' ? TextInputType.emailAddress : ( labelText == 'Phone*' ? TextInputType.phone : TextInputType.text),
            decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(fontSize: 12.0),
                border: OutlineInputBorder(),
                prefixIcon: labelText == 'Full Name*' ? Icon(Icons.person) : (labelText == 'Email*' ? Icon(Icons.email) : (labelText == 'Phone*' ? Icon(Icons.phone) : null)),
              suffixIcon: (labelText=='Password') ? IconButton(
                icon: obscurePassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                tooltip: 'Show Password',
                onPressed: ()=>  setState(() {
                  obscurePassword = !obscurePassword;
                }),
              ) : null,
            ),

          ));
}

