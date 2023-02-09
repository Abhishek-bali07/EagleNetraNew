import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../stores/support_page_view_model.dart';
import '../ui/theme.dart';


class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  late final SupportPageViewModel _vm;


  @override
  void initState() {
    _vm = SupportPageViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appBlack,
        leading: IconButton(
          onPressed: () {
            _vm.backToPrevious();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text("Support"),
      ),

      body: Container(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("We are always here to help you.",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Call Us @",style: TextStyle(fontSize: 20),),
                  Text("1086616235",style: TextStyle(fontSize: 22),),
                  SizedBox(
                    height: 14,
                  ),
                  Text("Email Us @",style: TextStyle(fontSize: 20),),
                  Text("Info@eaglenetra.com",style: TextStyle(fontSize: 22),),
                ],
              ),
            ),
          )
      ),
    );
  }


}
