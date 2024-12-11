import 'package:flutter/material.dart';
import 'first.dart'; // Import for MenuScreen if used elsewhere

void main() {
  runApp(const MainBike());
}

class MainBike extends StatelessWidget {
  const MainBike({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Sidebar Demo',
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F0F0), // AppBarの背景色
        elevation: 0, // 影を削除
        toolbarHeight: kToolbarHeight, // AppBarの高さを標準に設定
        automaticallyImplyLeading: false, // デフォルトの戻る矢印を無効化
        title: SizedBox(
          height: kToolbarHeight, // AppBar内のStackの高さを制限
          child: Stack(
            children: [
              // メニューアイコン（左側に配置）
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            DialogMenu(),
                        transitionsBuilder: (context, animation,
                            secondaryAnimation, child) {
                          const Offset begin = Offset(-1.0, 0.0); // 左から右にスライド
                          const Offset end = Offset.zero;
                          final Animatable<Offset> tween = Tween(
                              begin: begin, end: end)
                              .chain(CurveTween(curve: Curves.easeInOut));
                          final Animation<Offset> offsetAnimation = animation
                              .drive(tween);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Icon(
                    Icons.menu, // 普通のアイコンに変更
                    color: Colors.black, // アイコンの色
                    size: 24, // アイコンのサイズ
                  ),
                ),
              ),
              // 画像（右側に配置）
              Positioned(
                right: size.width * 0.24,
                //top: size.width * 0.01,
                child: Image.asset(
                  'images/b-icon.png',
                  width: 65,
                  height: 65,
                ),
              ),
              // テキスト(Biek'sAdventure)
              Positioned(
                right: size.width * 0.01,
                top: size.height * 0.01,
                child: Align(
                  alignment: Alignment.center,
                  child: Transform.rotate(
                    angle: -0.05, // テキストの傾き
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "ike's",
                            style: TextStyle(
                              fontFamily: 'JosefinSans', // カスタムフォントを適用
                              color: Colors.red,
                              fontSize: size.width * 0.05,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: " Adventure",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'MochiyPopPOne', // カスタムフォントを適用
                              fontSize: size.width * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              /*Positioned(
                right: size.width * 0.6,
                child: Text(
                  'Hi,Akito',
                  style: TextStyle(
                    color: Color(0xFF4C444D),
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                )
              )*/
            ],
          ),
        ),
      ),

      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DialogMenu()),
            );
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Color(0xFFF0F0F0), // AppBarの背景色をグレーに設定
              ),
            ),
            // Optional background gradient layer
            /*Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Colors.white.withOpacity(0.7),
                    Colors.blue,
                  ],
                ),
              ),
            ),*/
            /*Container(
              height: size.height * 0.3,
              child: Image.asset(
                'images/sky_blue.gif',
                fit: BoxFit.fill,
              ),
            ),*/
            Positioned(
                left: size.width * 0.05,
                top: size.height * 0.21,
                child: Container(
                  // ダイナミックなサイズ（親の幅の80%）
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: size.height * 0.42,
                  decoration: BoxDecoration(
                    color: Colors.white, // 内部の背景色
                    border: Border.all(
                      color: Colors.red, // 赤い淵
                      width: 4.5, // ボーダーの太さ
                    ),
                    borderRadius: BorderRadius.circular(15), // 角丸
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // 影の色
                        blurRadius: 10.0, // ぼかし
                        offset: Offset(4, 4), // 影の位置（x, y）
                      ),
                    ],
                  ),
                ),
            ),
            Positioned(
              left: size.width * 0.01,
              top: size.height * 0.07,
              child: Image.asset(
                'images/charactor.png',
                width: size.width * 0.18,
                height: size.height * 0.08,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: size.width * 0.07,
              top: size.height * 0.01,
              child: Image.asset(
                'images/nextmassege.png',
                width: size.width * 0.32,
                height: size.height * 0.08,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: size.width * 0.18,
              top: size.height * 0.012,
              child: Text(
                '次回',
                style: TextStyle(
                    fontFamily: 'MochiyPopPOne', // カスタムフォントを適用
                    color: Colors.black54, fontSize: size.width * 0.037
                ),

              ),
            ),
            Positioned(
              left: size.width * 0.1,
              top: size.height * 0.035,
              child: Text(
                'ツーリング予定',
                style: TextStyle(
                    fontFamily: 'MochiyPopPOne', // カスタムフォントを適用
                    color: Colors.black54, fontSize: size.width * 0.037
                ),

              ),
            ),
            Positioned(
              //left: size.width * 0.01, // 線のX座標
              top: size.height * 0.15,  // 線のY座標
              left: size.width * 0.03,
              child: Container(
                width: size.width * 0.95, // 線の幅
                height: 2,  // 線の高さ（厚み）
                decoration: BoxDecoration(
                  color: Colors.black54, // 線の色
                  gradient: LinearGradient(
                    colors: [Colors.grey.shade400, Colors.grey.shade700],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ), // グラデーションを適用
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // 影の色
                      offset: Offset(0, 2), // 影の位置
                      blurRadius: 4, // 影のぼかし
                    ),
                  ],
                  borderRadius: BorderRadius.circular(1), // 角丸にする（お洒落感アップ）
                ),
              ),
            ),

            /*Positioned(
              left: size.width * 0.01,
              top: size.height * 0.20,
              child: Image.asset(
                'images/comment.gif',
                width: size.width * 0.98,
                height: size.height * 0.30,
                fit: BoxFit.fill,
              ),
            ),\\\\\*/
            Positioned(
              left: size.width * 0.05, // 中央寄りに配置
              top: size.height * 0.68, // 画面の中央あたりに配置
              child: Container(
                width: size.width * 0.19, // 幅を画面幅の80%に設定
                height: size.height * 0.12, // 高さを画面高さの20%に設定
                decoration: BoxDecoration(
                  color: Colors.white, // 背景色を白に設定
                  borderRadius: BorderRadius.circular(15.0), // 角を丸くする
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // 影の色と透明度
                      spreadRadius: 5, // 影の広がり具合
                      blurRadius: 7, // ぼかし具合
                      offset: Offset(0, 3), // 影のオフセット (x, y)
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: size.width * 0.27, // 中央寄りに配置
              top: size.height * 0.68, // 画面の中央あたりに配置
              child: Container(
                width: size.width * 0.19, // 幅を画面幅の80%に設定
                height: size.height * 0.12, // 高さを画面高さの20%に設定
                decoration: BoxDecoration(
                  color: Colors.white, // 背景色を白に設定
                  borderRadius: BorderRadius.circular(15.0), // 角を丸くする
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // 影の色と透明度
                      spreadRadius: 5, // 影の広がり具合
                      blurRadius: 7, // ぼかし具合
                      offset: Offset(0, 3), // 影のオフセット (x, y)
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: size.width * 0.49, // 中央寄りに配置
              top: size.height * 0.68, // 画面の中央あたりに配置
              child: Container(
                width: size.width * 0.19, // 幅を画面幅の80%に設定
                height: size.height * 0.12, // 高さを画面高さの20%に設定
                decoration: BoxDecoration(
                  color: Colors.white, // 背景色を白に設定
                  borderRadius: BorderRadius.circular(15.0), // 角を丸くする
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // 影の色と透明度
                      spreadRadius: 5, // 影の広がり具合
                      blurRadius: 7, // ぼかし具合
                      offset: Offset(0, 3), // 影のオフセット (x, y)
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: size.width * 0.71, // 中央寄りに配置
              top: size.height * 0.68, // 画面の中央あたりに配置
              child: Container(
                width: size.width * 0.19, // 幅を画面幅の80%に設定
                height: size.height * 0.12, // 高さを画面高さの20%に設定
                decoration: BoxDecoration(
                  color: Colors.white, // 背景色を白に設定
                  borderRadius: BorderRadius.circular(15.0), // 角を丸くする
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // 影の色と透明度
                      spreadRadius: 5, // 影の広がり具合
                      blurRadius: 7, // ぼかし具合
                      offset: Offset(0, 3), // 影のオフセット (x, y)
                    ),
                  ],
                ),
              ),
            ),
            /*Positioned(
              left: size.width * 0.05, // 中央寄りに配置
              top: size.height * 0.6, // 画面の中央あたりに配置
              child: Container(
                width: size.width * 0.9, // 幅を画面幅の80%に設定
                height: size.height * 0.1, // 高さを画面高さの20%に設定
                decoration: BoxDecoration(
                  color: Colors.white, // 背景色を白に設定
                  borderRadius: BorderRadius.circular(15.0), // 角を丸くする
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // 影の色と透明度
                      spreadRadius: 5, // 影の広がり具合
                      blurRadius: 7, // ぼかし具合
                      offset: Offset(0, 3), // 影のオフセット (x, y)
                    ),
                  ],
                ),
              ),
            ),*/
            Positioned(
              bottom: size.height * 0.22,
              child: Text(
                '冒険に関する設定',
                style: TextStyle(
                  fontFamily: 'MochiyPopPOne', // カスタムフォントを適用
                  color: const Color(0xFF4C444D),
                  //color: Colors.black54,
                  fontSize: size.width * 0.05,
                  //fontWeight: FontWeight.bold, // 必要なら指定
                  /*shadows: [
                    Shadow(
                      offset: const Offset(2, 2),
                      blurRadius: 3,
                      color: Colors.black.withOpacity(0.2), // 文字に影を追加
                    ),
                  ],*/
                ),
              ),
            ),
            Positioned(
              left: size.width * 0.11,
              top: size.height * 0.71,
              child: Image.asset(
                'images/cicle.png',
                width: size.width * 0.08,
                height: size.height * 0.04,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: size.width * 0.33,
              top: size.height * 0.71,
              child: Image.asset(
                'images/Trash.png',
                width: size.width * 0.08,
                height: size.height * 0.04,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: size.width * 0.55,
              top: size.height * 0.71,
              child: Image.asset(
                'images/Edit.png',
                width: size.width * 0.08,
                height: size.height * 0.04,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: size.width * 0.75,
              top: size.height * 0.70,
              child: Image.asset(
                'images/check.jpg',
                width: size.width * 0.14,
                height: size.height * 0.07,
                fit: BoxFit.fill,
              ),
            ),

            Positioned(
              top: size.height * 0.9, // 画面の中央あたりに配置
              child: Container(
                width: size.width * 1, // 幅
                height: size.height * 0.08, // 高さ
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5), // 透明度50%の白色
                  borderRadius: BorderRadius.circular(15), // 丸みを帯びた角
                  border: Border.all(
                    color: Colors.white.withOpacity(0.8), // 少し濃い白色の枠線
                    width: 2, // 枠線の幅
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // 薄い影
                      blurRadius: 10,
                      offset: const Offset(0, 5), // 影の位置
                    ),
                  ],

                ),
              ),
            ),

            Positioned(
              top: size.height * 0.81, // 中央付近に配置
              child: Container(
                width: size.width * 1.0,
                height: size.height * 0.08,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5), // 透明な白背景
                  border: Border(
                    top: BorderSide(
                      color: Colors.white70, // 上部の枠線をグレーに設定
                      width: 1, // 枠線の幅
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // 薄い影
                      blurRadius: 10,
                      offset: const Offset(0, 5), // 影の位置
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 均等に配置
                  children: [
                    Image.asset(
                      'images/homeicon.png',
                      width: size.width * 0.05, // 各画像の幅
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      'images/message.png',
                      width: size.width * 0.05,
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      'images/Star.png',
                      width: size.width * 0.05,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}
