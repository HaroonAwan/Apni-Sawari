
import 'package:apni_sawari/Widgets/custom-datepicker.dart';
import 'package:apni_sawari/pages/mapPage.dart';
import 'package:apni_sawari/utils/custom-navigator.dart';
import 'package:flutter/material.dart';
import 'pet_relocation-data.dart';

class TravelItinerary extends StatefulWidget {
  final TabController controller;
  TravelItinerary({this.controller});
  @override
  State<StatefulWidget> createState() {
    return TravelItineraryState();
  }
}

class TravelItineraryState extends State<TravelItinerary>with AutomaticKeepAliveClientMixin {

  var travelFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  TextEditingController departureCity= TextEditingController();
  TextEditingController arrivalCity= TextEditingController();
  TextEditingController comments= TextEditingController();
  List<String> cities;
  DateTime dateOfTravel = DateTime.now();



  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    InheritedPetRelocation.of(context).departureCity = departureCity;
    InheritedPetRelocation.of(context).arrivalCity = arrivalCity;
    dateOfTravel = InheritedPetRelocation.of(context).dateOfTravel;
    InheritedPetRelocation.of(context).comments =comments;

    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(8),
          child: Form(
            key: travelFormKey,
            autovalidate: _autoValidate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
            Center(
              child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 15.0),
                        blurRadius: 15.0),
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, -10.0),
                        blurRadius: 10.0),
                  ]),
              child: RaisedButton(
                child: Text("Select Location"),
                onPressed: (){
                  CustomNavigator.navigateTo(context, MapPage());
                },
              )),
            ),
                SizedBox(height: 10),
                _buildTextField(context, departureCity, "Departure City*"),

                SizedBox(height: 10),
                _buildTextField(context, arrivalCity, "Arrival City*"),
                SizedBox(height: 10),
                DatePickerField(
                  title: "Estimated Date Of Travel",
                  onChanged: (date) {
                    dateOfTravel = date;
                  },
                ),
                SizedBox(height: 10,),
                _buildTextField(context, comments, "Comments"),
                SizedBox(height: 10),
                SizedBox(
                  width: 100,
                  child: RaisedButton(
                      child: Row(children: <Widget>[
                        Text("Next"),
                        Icon(Icons.arrow_forward, size: 18)
                      ], mainAxisAlignment: MainAxisAlignment.spaceBetween),

                      onPressed: () {
                        if(travelFormKey.currentState.validate()){
                          setState(() {
                            isDisabledPetRelocation[widget.controller.index+1] = false;
                          });
                          widget.controller.animateTo(widget.controller.index+1);
                        }else{
                          setState(() {
                            _autoValidate = true;
                          });
                        }
                      }
                  ),
                )

              ],
            ),
          )
      ),
    );
  }

  _buildTextField(
      context,
      textFieldController,
      labelText,
      ) =>
      TextFormField(
        validator: (value){
          if(labelText=='Comments'){
            return null;
          }
          return value.isEmpty ? 'Please enter $labelText' : null;
        },
        controller: textFieldController,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      );

  @override
  bool get wantKeepAlive => true;
}
