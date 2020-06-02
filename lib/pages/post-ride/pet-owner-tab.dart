
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pet_relocation-data.dart';

class PetOwner extends StatefulWidget  {
  TabController tabController;
  PetOwner({
  this.tabController
  });
  @override
  _PetOwnerState createState() => _PetOwnerState();
}

class _PetOwnerState extends State<PetOwner> with AutomaticKeepAliveClientMixin  {

  bool _autoValidate = false;
  var petOwnerFormKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();



  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    var _relocationData = InheritedPetRelocation.of(context);
    _relocationData.name =  _name;
    _relocationData.email = _email;
    _relocationData.phone = _phone;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: petOwnerFormKey,
          autovalidate: _autoValidate,
          child: Column(
            children: <Widget>[
              _buildTextField(context, _name, 'Name*'),
              _buildTextField(context, _email, 'Email*'),
              _buildTextField(context, _phone, 'Phone*'),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text("Send"),
                    onPressed: () async {
                      var _data = InheritedPetRelocation.of(context);

                      bool relocationValidate(){
                        if(_data.weight.text==''){
                          widget.tabController.animateTo(0);
                          return false;
                        }
                        if(_data.departureCity.text=='' ||_data.arrivalCity.text=='' ){
                          widget.tabController.animateTo(1);
                          return false;
                        }
                        return true;
                      }

                      if(petOwnerFormKey.currentState.validate() && relocationValidate()){

                        FocusScope.of(context).requestFocus(FocusNode());
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Submitting your request..."),
                        ));
                        Scaffold.of(context).hideCurrentSnackBar();

                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("We have received your request to move your pet."),
                        ));
                        Future.delayed(Duration(seconds: 2),
                                () => Navigator.of(context).pop());
                      }
                      else{
                        setState(() {
                          _autoValidate=true;
                        });
                      }
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
              if(value.isEmpty){
                return 'Please enter $labelText';
              }
              if(labelText=='Email*' && !value.contains("@")){
                return 'Email must have "@"';
              }
              return null;
            },
            controller: textFieldController,
            keyboardType: labelText == 'Email*' ? TextInputType.emailAddress : ( labelText == 'Phone*' ? TextInputType.phone : TextInputType.text),
            decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(fontSize: 12.0),
                border: OutlineInputBorder(),
                prefixIcon: labelText == 'Name*' ? Icon(Icons.person) : (labelText == 'Email*' ? Icon(Icons.email) : Icon(Icons.phone))
            ),
          ));

  @override
  bool get wantKeepAlive => true;
}




