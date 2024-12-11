import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyMap());
}

class MyMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Current Location with Sidebar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GoogleMapController? _controller;
  LatLng? _currentPosition;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // 現在地を取得
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 位置情報サービスが有効かどうか確認
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    // 位置情報の権限を確認
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    // 現在地を取得
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _markers.add(
        Marker(
          markerId: MarkerId('currentLocation'),
          position: _currentPosition!,
          infoWindow: InfoWindow(title: 'Your Location'),
        ),
      );
    });

    _controller?.animateCamera(
      CameraUpdate.newLatLngZoom(_currentPosition!, 15),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          color: Color(0xFF373939),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Vidhan Sharma"),
                accountEmail: Text("vidhan.sharma@yahoo.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://via.placeholder.com/150"), // replace with real image
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.001), // 上部に画面の20%のパディングを設定
                child: Container(
                  color: Color(0xFF1E1F1F),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top:size.height * 0.01,left: size.width * 0.02),
                            child: Text('あなたのツーリング', // 追加したテキスト
                              style: TextStyle(color: Color(0xFF737979), fontSize: size.width * 0.035, fontWeight: FontWeight.bold),
                            ),
                          ),
                      ),
                      ListTile(
                        leading: Icon(Icons.history, color: Colors.white),
                        title: Text('Memory(ツーリング履歴)', style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: Icon(Icons.account_balance_wallet, color: Colors.white),
                        title: Text('予定一覧', style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: Icon(Icons.card_giftcard, color: Colors.white),
                        title: Text('予定作成', style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on, color: Colors.white),
                        title: Text('ガチャ追加', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.004), // 上部に画面の20%のパディングを設定
                child: Container(
                  color: Color(0xFF1E1F1F),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top:size.height * 0.01,left: size.width * 0.02),
                            child: Text(
                              'お友達に関する設定', // 追加したテキスト
                              style: TextStyle(color: Color(0xFF737979), fontSize: size.width * 0.035, fontWeight: FontWeight.bold),
                            ),
                          )
                      ),
                      ListTile(
                        leading: Icon(Icons.history, color: Colors.white),
                        title: Text('お友達一覧', style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: Icon(Icons.account_balance_wallet, color: Colors.white),
                        title: Text('お友達検索', style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: Icon(Icons.card_giftcard, color: Colors.white),
                        title: Text('リクエスト一覧', style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on, color: Colors.white),
                        title: Text('メッセージ', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.004), // 上部に画面の20%のパディングを設定
                child: Container(
                  color: Color(0xFF1E1F1F), // Log Out タイルの背景色
                  child: Column(
                    children: [
                      Align(
                      alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top:size.height * 0.01,left: size.width * 0.02),
                          child: Text(
                            'その他', // 追加したテキスト
                            style: TextStyle(color: Color(0xFF737979), fontSize: size.width * 0.035, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.logout, color: Colors.white),
                        title: Text('設定', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.004), // 上部に画面の20%のパディングを設定
                child: Container(
                  color: Color(0xFF1E1F1F), // Log Out タイルの背景色
                  child: ListTile(
                    leading: Icon(Icons.logout, color: Colors.white),
                    title: Text('Log Out', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body: _currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.10,
          right: size.height * 0.02,
          left: size.height * 0.02,
        ),
        child: Column(
          children: [
            Container(
              child: Image.asset(
                'images/fuji.jpg', // 実際のアセットパス
                height: size.height * 0.25, // 高さ（任意）
                fit: BoxFit.cover, // 画像のフィット方法（任意）
              ),
              //child: // 他のウィジェットを追加する場所
            ),

          ],
        ),
      ),
    );
  }
}