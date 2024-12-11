import 'package:flutter/material.dart';
import 'main.dart'; // Main()をインポート

class DialogMenu extends StatefulWidget {
  @override
  _DialogMenuState createState() => _DialogMenuState();
}

class _DialogMenuState extends State<DialogMenu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageRouteBuilder<Object?> blackOut(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionDuration: const Duration(milliseconds: 880),
      reverseTransitionDuration: const Duration(milliseconds: 880),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final color = ColorTween(
          begin: Colors.transparent,
          end: Colors.black,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.5, curve: Curves.easeInOut),
          ),
        );
        final opacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.5, 1, curve: Curves.easeInOut),
          ),
        );
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
              color: color.value,
              child: Opacity(
                opacity: opacity.value,
                child: child,
              ),
            );
          },
          child: child,
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          // ListViewをStackの中に入れる
          Container(
            color: Color(0xFF373939),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("Vidhan Sharma"),
                  accountEmail: Text("vidhan.sharma@yahoo.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://via.placeholder.com/150"), // 画像を本物に差し替え
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade400, // 明るいグレー
                        Colors.grey.shade700, // 中間のグレー
                        Colors.grey.shade900, // 暗いグレー
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // 軽い影を追加
                        blurRadius: 10, // 影のぼかし具合
                        offset: Offset(5, 5), // 影の位置
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5), // ハイライト効果
                        blurRadius: 10,
                        offset: Offset(-5, -5),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Color(0xFF1E1F1F),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.01, left: size.width * 0.02),
                          child: Text(
                            'あなたのツーリング',
                            style: TextStyle(
                              color: Color(0xFF737979),
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.history, color: Colors.white),
                        title:
                        Text('冒険図鑑', style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: Icon(Icons.account_balance_wallet,
                            color: Colors.white),
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
                      ListTile(
                        leading: Icon(Icons.location_on, color: Colors.white),
                        title: Text('Memory', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.004),
                  child: Container(
                    color: Color(0xFF1E1F1F),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: size.height * 0.01, left: size.width * 0.02),
                            child: Text(
                              'お友達に関する設定',
                              style: TextStyle(
                                color: Color(0xFF737979),
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.history, color: Colors.white),
                          title: Text('お友達一覧',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_balance_wallet,
                              color: Colors.white),
                          title: Text('お友達追加',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.location_on, color: Colors.white),
                          title: Text('メッセージ',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.004),
                  child: Container(
                    color: Color(0xFF1E1F1F),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: size.height * 0.01, left: size.width * 0.02),
                            child: Text(
                              'その他',
                              style: TextStyle(
                                color: Color(0xFF737979),
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.logout, color: Colors.white),
                          title:
                          Text('設定', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.004),
                  child: Container(
                    color: Color(0xFF1E1F1F),
                    child: ListTile(
                      leading: Icon(Icons.logout, color: Colors.white),
                      title: Text('Log Out',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 白いUIを斜めに表示する
          Positioned(
            right: -size.width * 0.35,
            top: size.height * 0.22,
            child: Transform.rotate(
              angle: -0.20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(size.width * 0.08), // 角を丸くする
                child: Container(
                  width: size.width * 0.7,
                  height: size.height * 0.65,
                  decoration: const BoxDecoration(
                    color: Color(0xFFdcdcdc), // 背景色を指定
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: -size.width * 0.32,
            top: size.height * 0.25,
            child: Transform.rotate(
              angle: -0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(size.width * 0.08), // 角を丸くする
                child: Container(
                  width: size.width * 0.7,
                  height: size.height * 0.63,
                  decoration: const BoxDecoration(
                    color: Colors.white70, // 背景色を指定
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: -size.width * 0.38,
            top: size.height * 0.19,
            child: GestureDetector(
              onTap: () {
                // 画面遷移を実行
                Navigator.push(
                  context,
                  blackOut(MainScreen())
                );
              },
              child: Transform.rotate(
                // 斜度を設定
                angle: -0.15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(size.width * 0.08), // 角を丸くする
                  child: Container(
                    width: size.width * 0.7,
                    height: size.height * 0.7,
                    decoration: const BoxDecoration(
                      color: Colors.black, // 背景色を指定
                    ),
                    child: const MainBike(), // 別ファイルから取得したUIを表示
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
