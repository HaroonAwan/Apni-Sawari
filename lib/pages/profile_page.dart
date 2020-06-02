import 'package:apni_sawari/Widgets/custom-datepicker.dart';
import 'package:apni_sawari/services/connectivityService.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _editMode = true;
  bool _isChanged = false;
  bool isInternetConnected;

  bool _useSameForShipping = false;
  DateTime _contractStartDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    isInternetConnected = checkConnectionStatus(context);
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),

      body: CustomScrollView(
        slivers: _editMode? _buildEditMode(): _buildViewMode()
      ),
    );
  }

  _buildEditMode() {
    return <Widget>[
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: CircleAvatar(maxRadius: 70, backgroundColor: Theme.of(context).primaryColor),
        ),
      ),

      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 10),

        sliver: SliverList(delegate: SliverChildListDelegate([
          Padding(
            padding: EdgeInsets.only(
                left: 16, right: 16, top: 32, bottom: 8),
            child: TextField(
              style: TextStyle(fontSize: 18),
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: 'Name',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),         Padding(
            padding: EdgeInsets.only(
                left: 16, right: 16, top: 32, bottom: 8),
            child: TextField(
              style: TextStyle(fontSize: 18),
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: 'Email',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),

          Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 10),
              child: DropdownButton(
                value: "female",
                onChanged: (val) {
                  print(val);
                },
                hint: Text("Gender"),
                items: <DropdownMenuItem>[
                  DropdownMenuItem(value: "male", child: Text("Male")),
                  DropdownMenuItem(value: "female", child: Text("Female")),
                ],
              ),
            ),

            Expanded(child: DatePickerField(
              title: "Date of Birth",
              onChanged: (date) {
                _contractStartDate = date;
              },
            ),)
          ]),

          Padding(
            padding: EdgeInsets.only(
                left: 16, right: 16, top: 32, bottom: 8),
            child: TextField(
              style: TextStyle(fontSize: 18),
              keyboardType: TextInputType.phone,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: 'Phone',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),        ])),
      ),

      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              child: Text("Other", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        )
      ),

      SliverPadding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 20),

        sliver: SliverList(delegate: SliverChildListDelegate([
          DropdownButton(hint: Text("Select Country"), items: [
            DropdownMenuItem(child: Text("India"), value: "india"),
            DropdownMenuItem(child: Text("Pakistan"), value: "pakistan"),
          ], isExpanded: true, onChanged: (val) {}),
//          CustomFormField("City"),
//          CustomFormField("Zip Code"),
//          CustomFormField("Address", lines: null),

//          Row(children: <Widget>[
//            Checkbox(
//              value: this._useSameForShipping,
//              activeColor: Theme.of(context).primaryColor,
//              onChanged: (val) => setState(() => this._useSameForShipping = val)
//            ),
//            Text("Use Address for Shipping"),
//          ])
        ])),
      ),

    ];
  }

  _buildViewMode() {
    return [];
//    return Column(children: <Widget>[
//
//    ]);
  }
}
