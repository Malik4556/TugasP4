import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'secondpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: snackbarPage(),
      home: Scaffold(
        //  key: _messangerKey,
        appBar: AppBar(title: (Text("Snackbar"))),
        body: MyPage(),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

   showToast() {
    setState(() {
      Fluttertoast.showToast(
          msg: 'This is notification from toast',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER);
    });
  }

  final snackBar = SnackBar(
    content: const Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
//Button Ok
  void showAlert(BuildContext context) {
    setState(() {
      Widget buttonOk = MaterialButton(
        child: Text("Ok"),
        onPressed:() {
          Navigator.of(context).pop(); 
    },
    );
//Button Cancel
    Widget buttonCancel = MaterialButton(
        child: Text("Cancel"),
        onPressed:() {
          Navigator.of(context).pop(); 
    },
    );

    AlertDialog alert = AlertDialog(
    title: Text("Simple Alert"),
    // content: Text("Notification From Alert"),
    content: TextField(), //Diisi dengan TextField
    actions: [
      buttonOk,
      buttonCancel, //Tambahan Cancel
    ],
  );

  showDialog(
    context: context, 
    builder: (BuildContext context) {
      return alert;
    });
    });
  }

  @override
  Widget build(BuildContext context) {
     return Center(
      child: Builder(
        builder: (context)=> Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(onPressed: () {showToast();}, child: Text("Show Toast"),),
          MaterialButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text("Show Snackbar"),
          ),
          MaterialButton(onPressed: () {showAlert(context);}, child: Text("Show Alert"),),

          MaterialButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
          },
          color: Colors.blue,
          child: Text("Pergi Ke halaman Ke-2", style: TextStyle(color: Colors.white))),
        ],
        ),
      ),
    );
  }
}
