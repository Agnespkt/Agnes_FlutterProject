import 'package:flutter/material.dart';
import 'package:project_ver3/services/firestore_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddRecordPage extends StatefulWidget {
  @override
  _AddRecordPageState createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  String vehicleNo;
  String vehicleModel;
  String regDate;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Add Vehicle'),
          actions: <Widget>[]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Vehicle Number'),
                  validator: (val) =>
                      val.length == 0 ? "Enter Vehicle Number" : null,
                  onSaved: (val) => this.vehicleNo = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Vehicle Model'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Vehicle Model' : null,
                  onSaved: (val) => this.vehicleModel = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Registration Date'),
                  validator: (val) =>
                      val.length == 0 ? 'Registration Date' : null,
                  onSaved: (val) => this.regDate = val,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    onPressed: _submit,
                    child: Text('Add Vehicle Record'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    FirestoreService().addVehicleData(vehicleNo, vehicleModel, regDate);
    Fluttertoast.showToast(
        msg: "Data saved successfully", gravity: ToastGravity.TOP);
  } //_submit
} //_AddRecordPageState
