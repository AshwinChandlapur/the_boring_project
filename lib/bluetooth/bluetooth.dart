import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class Bluetooth extends StatefulWidget {
  @override
  State createState() {
    return _BluetoothState();
  }
}


class _BluetoothState extends State<Bluetooth> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothDevice> bluedevices = List<BluetoothDevice>();
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  List<String> bluetoothDevices = List<String>();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text("Scan Devices"),
              onPressed: () {
                /// Start scanning
                debugPrint("Starting Scan");
                _scaffoldState.currentState.showSnackBar(
                    SnackBar(content: Text("Scanning....")));
                flutterBlue.scan().listen((scanResult) {
                  var device = scanResult.device;
                  if(device.name =="" || device.name==null){
                      print("Empty Device");
                  }else{
                    if(!bluetoothDevices.contains(device.name)){
                      bluetoothDevices.insert(0,device.name);
                      _listKey.currentState.insertItem(0);
                    }
                    _scaffoldState.currentState.showSnackBar(
                        SnackBar(content: Text("${device.name.toString()}")));
                    print('${device.name} found! rssi: ${scanResult.rssi}');
                  }
                });
              },
            ),
          Expanded(
            child: SizedBox(
              height: 300.0,
              child: AnimatedList(
                key: _listKey,
                itemBuilder: (context,index,animation){
                  return ListTile(title: Text(bluetoothDevices[index]));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> getDevices(){
    setState(() {
      bluedevices.map((device)=>Text(device.name)).toList();
    });
  }
}
