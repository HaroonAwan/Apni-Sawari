import 'package:apni_sawari/Widgets/round-drop-down-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pet_relocation-data.dart';

class PetDetails extends StatefulWidget  {
  final TabController controller;

  PetDetails({this.controller});

  @override
  PetDetailsState createState() => PetDetailsState();
}

class PetDetailsState extends State<PetDetails> with AutomaticKeepAliveClientMixin {
  
  var petDetailFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  TextEditingController weight = TextEditingController();
  TextEditingController length= TextEditingController();
  TextEditingController width= TextEditingController();
  TextEditingController height= TextEditingController();
  PetRelocationData data;

  String selectedGender;
  String selectedAge;


  final _seats = <String>['1', '2', '3', '4', '5', 'More Than 5 '];

  final _cars = <String>['Civic', 'City', 'Gli'];





  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    var _relocationData = InheritedPetRelocation.of(context);
    _relocationData.weight = weight;
    _relocationData.length = length;
    _relocationData.width = width;
    _relocationData.height = height;
    _relocationData.selectedGender = selectedGender;
    _relocationData.selectedAge = selectedAge;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          autovalidate: _autoValidate,
          key: petDetailFormKey,
          child: Column(children: <Widget>[


            SizedBox(height: 10),

            RoundDropDownButton<String>(
              hint: Text("Select Car*"),
              items: _cars.map((gender) {
                return DropdownMenuItem(
                  child: Text(gender),
                  value: gender,
                );
              }).toList(),
              value: selectedGender,

              onChanged: (item) => setState(() { this.selectedGender = item;
              FocusScope.of(context).requestFocus(new FocusNode());
              }),
            ),


            SizedBox(height: 10),
            RoundDropDownButton<String>(
              hint: Text("Seats"),
              items: _seats.map((age) {
                return DropdownMenuItem(
                    child: Text(age),
                    value: age
                );
              }).toList(),
              value: selectedAge,
              onChanged: (item) => setState(() { this.selectedAge = item;
              FocusScope.of(context).requestFocus(new FocusNode());
              }),
            ),
            SizedBox(height: 10),
            _buildTextField(context, weight, "Car No*"),
            SizedBox(height: 10),
//            Row(
//              children: <Widget>[
//                Expanded(child: _buildTextField(context, length, "Length")),
//                Expanded(child: _buildTextField(context, width, "Width")),
//                Expanded(child: _buildTextField(context, height, "Height")),
//              ],
//            ),
            SizedBox(
              width: 100,
              child: RaisedButton(
                  child: Row(children: <Widget>[
                    Text("Next"),
                    Icon(Icons.arrow_forward, size: 18)
                  ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  onPressed: () {
                    if(petDetailFormKey.currentState.validate()){

                      setState(() {
                        isDisabledPetRelocation[widget.controller.index+1] = false;
                      });
                      widget.controller.animateTo(widget.controller.index+1);
                    }
                    else{
                      setState(() {
                        _autoValidate=true;
                      });
                    }
                  }
              ),
            ),
          ], crossAxisAlignment: CrossAxisAlignment.end),
        ),
      ),
    );

  }
  _buildTextField(
      context,
      textFieldController,
      labelText,
      ) =>
      TextFormField(
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          validator: (value){
            if(labelText=='Length' || labelText=='Width' || labelText=='Height'){
              return null;
            }
            return value.isEmpty ? 'Please enter $labelText' : null;
          },
          controller: textFieldController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(fontSize: 12.0),
            border: OutlineInputBorder(),
          ));

  @override
  bool get wantKeepAlive => true;
}