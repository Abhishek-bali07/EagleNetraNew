import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helpers/image_assets.dart';
import '../ui/theme.dart';


class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appBlack,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              if(!Scaffold.of(context).isDrawerOpen) {
                Scaffold.of(context).openDrawer();
              }
            },
            icon: Icon(Icons.menu,size: 40,color: AppColors.drawerPrimary,),
          ),
        ),
        title: Container(
          width: 50,
          child: Image.asset(ImageAssets.logo),
        ),

        actions: [

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications,size: 40,color: AppColors.drawerPrimary, ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(flex: 1, child: _upperSideContent()),
            Expanded(flex: 7, child: _lowerSideContent())
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.SilverChalice,
        foregroundColor: AppColors.Black,
        onPressed: (){


        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(

        child: ListView(

          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Abhishek Mishra"),
              accountEmail: Text("abhishekm977@gmail.com"),
              decoration: BoxDecoration(
                color: AppColors.drawerPrimary,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home), title: Text("Dashboard "),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(" Safe Area"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings), title: Text("My Kids"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts), title: Text("SOS Numbers"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.home), title: Text("History"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.home), title: Text("Access"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.subscriptions), title: Text("Subscription"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.support), title: Text("Support "),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.logout), title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

    );




  }


  @override
  Widget _upperSideContent() {
    return Container(

    );
  }


  @override
  Widget _lowerSideContent() {
    return SafeArea(
      child: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(ImageAssets.kidsImage),
            ),
            Text("Add your childs smart card.", style: TextStyle(
              fontSize: 25.sp,

            ),)
          ],
        ),
      ),
    );


  }
}
