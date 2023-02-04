import 'package:flutter/material.dart';

class ManagementAccessPage extends StatefulWidget {
  const ManagementAccessPage({Key? key}) : super(key: key);

  @override
  State<ManagementAccessPage> createState() => _ManagementAccessPageState();
}

class _ManagementAccessPageState extends State<ManagementAccessPage> {
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.appBlack,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Add Kid"),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             
              Expanded(flex: 8, child: _lowerSideContent())
            ],
          ),
        ),
      );
    }
    );
  }



  Widget _lowerSideContent() {
    return SafeArea(
        child: child)
  }
}

