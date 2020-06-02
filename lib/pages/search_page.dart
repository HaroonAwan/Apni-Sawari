
import 'package:apni_sawari/Widgets/round-drop-down-button.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  int _petFor;
  String _searchType = 'Sell';
  Future _citiesFuture;
  List<String> _cities;
  String _selectedCity;
  List<String> gender = ['Male','Female'];
  String _gender;
  List<String> cities = [
    'Karachi',
        'Lahore',
    'Faisalabad',
    'Rawalpindi',
    'Gujranwala',
    'Peshawar',
  ];


  void radioButtonChanges(int value) {
    setState(() {
      _petFor = value;
      switch (value) {
        case 1:
          _searchType = 'Ridee';
          break;
        case 2:
          _searchType = 'Driver';
          break;
        default:

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
             Container(
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
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                            text: '7904 Riders and Drivers ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'to choose from',
                                style: TextStyle(color: Colors.blue, fontSize: 24,fontWeight: FontWeight.normal),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RoundDropDownButton<String>(
                        hint: Text("Select City*"),
                        items: cities == null ? []: cities.map((city) {
                          return DropdownMenuItem<String>(
                            child: Text(city),
                            value: city,
                          );
                        }).toList(),
                        value: _selectedCity,
                        onChanged: (item) => setState(() { this._selectedCity = item;
                        }),
                      ),
                    ),

                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RoundDropDownButton<String>(
                        hint: Text("Gender of Driver/Ridee"),
                        items: gender
                            .map((i) => DropdownMenuItem<String>(
                            child: Text(i), value: i))
                            .toList(),
                        value: _gender,
                        onChanged: (item) => setState(() { this._gender = item;
                        FocusScope.of(context).requestFocus(new FocusNode());
                        }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                          groupValue: _petFor,
                          value: 1,
                          onChanged: radioButtonChanges,
                          activeColor: Colors.primaries[0],
                        ),
                        Text('Driver'),
                        Radio(
                          groupValue: _petFor,
                          value: 2,
                          onChanged: radioButtonChanges,
                          activeColor: Colors.primaries[0],
                        ),
                        Text('Rider'),
                      ],
                    ),
                    RaisedButton(
                      shape: StadiumBorder(),
                      onPressed: (){

                      },
                      child: Text("Search"),
                    )
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
