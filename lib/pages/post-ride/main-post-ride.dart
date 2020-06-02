import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'pet-details-tab.dart';
import 'pet-owner-tab.dart';
import 'pet_relocation-data.dart';
import 'travel-itinerary-tab.dart';

class PetRelocationPage extends StatefulWidget {
  @override
  _PetRelocationPageState createState() => _PetRelocationPageState();
}

class _PetRelocationPageState extends State<PetRelocationPage>
    with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    this._tabController = TabController(
      length: 3,
      vsync: this
    );
    _tabController.addListener((){

      if (isDisabledPetRelocation[_tabController.index]) {
        int index = _tabController.previousIndex;
        setState(() {
          _tabController.index = index;
        });
      }
      if(_tabController.indexIsChanging)
      {
        FocusScope.of(context).unfocus();
      }

    });


  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return InheritedPetRelocation(
      child: WillPopScope(
        onWillPop: () async {
          if(_tabController.index>0){
            _tabController.animateTo(_tabController.index-1);
            return false;
          }
          else{
            isDisabledPetRelocation = [false,true,true];
            return true;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.black,),
              onPressed: () {
                if(_tabController.index>0){
                  _tabController.animateTo(_tabController.index-1);
                }else{
                  Navigator.of(context).pop();
                }
              }
            ),
            backgroundColor: Colors.white,
            title: Text("Post a Ride", style: TextStyle(color: Colors.black)),
            bottom: PreferredSize(
              child: Container(
                constraints: BoxConstraints.expand(height: 50),
                color: Colors.grey.shade200,
                child: TabBar(
                    indicator: BoxDecoration(color: Theme.of(context).primaryColor),
                    unselectedLabelColor: Colors.grey,
                    controller: this._tabController,
                    tabs: <Widget>[
                      Tab(child: Text("Car Details")),
                      Tab(child: Text("Travel Itinerary")),
                      Tab(child: Text("Contact Details")),
                    ],

                ),
              ),
              preferredSize: Size.fromHeight(50),
            )
          ),
          body:  TabBarView(
              controller: this._tabController,
              children: <Widget>[
                PetDetails(controller:_tabController),
                TravelItinerary(controller:_tabController),
                PetOwner(tabController: this._tabController,)
              ],
              physics: NeverScrollableScrollPhysics(),
            ),
        ),
      ),
    );
  }

}


