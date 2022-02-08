import 'package:flutter/material.dart';
import 'package:project_ver3/model/vehiclemodel.dart';
import 'package:project_ver3/services/firestore_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecordsPage extends StatefulWidget {
  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Vehicle Records'),
      ),
      body: FutureBuilder<List<VehicleModel>>(
        future: FirestoreService().readVehicleData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Vehicle Number: ' +
                                        snapshot.data[index].vehicleNo ??
                                    '',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.0),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Text(
                              'Vehicle Model: ' +
                                      snapshot.data[index].vehicleModel ??
                                  '',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.0),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                'Registration Date: ' +
                                        snapshot.data[index].regDate ??
                                    '',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.0),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: RaisedButton(
                                onPressed: () async {
                                  setState(() {
                                    FirestoreService().deleteVehicleData(
                                        snapshot.data[index].uid);
                                  });
                                  Fluttertoast.showToast(
                                      msg: "Data deleted successfully",
                                      gravity: ToastGravity.TOP);
                                },
                                child: Text('Delete Vehicle Record'),
                              )),
                        ],
                      ),

                      // IconButton(
                      //   color: Colors.blue,
                      //   icon: Icon(Icons.delete),
                      //   onPressed:
                      // )
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
} //_RecordsPageState
