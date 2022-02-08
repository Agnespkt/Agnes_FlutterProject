import 'dart:async';
import 'package:flutter/material.dart';
import 'httpservice.dart';
import 'carparks.dart';

class CPJsonParse extends StatefulWidget {
  CPJsonParse({Key key}) : super(key: key);
  @override
  _CPJsonParseState createState() => _CPJsonParseState();
}

class Debouncer {
  final int msecond;
  VoidCallback action;
  Timer _timer;
  Debouncer({this.msecond});
  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: msecond), action);
  }
}

class _CPJsonParseState extends State<CPJsonParse> {
  final debouncer = Debouncer(msecond: 1000);
  List<Value> _cp;
  bool _loading;
  @override
  void initState() {
    super.initState();
    _loading = true;
    HttpService.getCarparks().then((cp) {
      setState(() {
        _cp = cp;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(_loading ? 'Loading...' : 'Traffic Conditions'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            searchTF(),
            Expanded(
              child: ListView.builder(
                itemCount: null == _cp ? 0 : _cp.length,
                itemBuilder: (context, index) {
                  Value cpAvail = _cp[index];
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 5.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Start Destination: ' + cpAvail.startPoint,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                              Text(
                                'End Destination: ' + cpAvail.endPoint,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                              Text(
                                'Estimated Time: ' +
                                    cpAvail.estTime.toString() +
                                    'min(s)',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchTF() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(5.0),
          ),
        ),
        filled: true,
        fillColor: Colors.white60,
        contentPadding: EdgeInsets.all(15.0),
        hintText: 'Search Destination',
      ),
      onChanged: (string) {
        debouncer.run(() {
          HttpService.getCarparks().then((uCp) {
            setState(() {
              _cp = Value.filterList(uCp, string);
            });
          });
        });
      },
    );
  }
}
