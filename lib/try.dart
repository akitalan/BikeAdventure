import 'package:flutter/material.dart';

void main() {
  runApp(const Try());
}

class Try extends StatelessWidget {
  const Try({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Transparent Container',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TryContainer(),
    );
  }
}

class TryContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transparent Container Test'),
      ),
      body: Stack(
        children: [
          // 背景画像や色の設定
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/_sky.gif'), // 背景画像を指定
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // 確認用の枠付きContainer
          Positioned(
            top: size.height * 0.4, // 中央付近に配置
            left: size.width * 0.1, // 少し余白を取る
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // 透明な白背景
                borderRadius: BorderRadius.circular(15), // 丸みを帯びた角
                border: Border.all(
                  color: Colors.grey, // 枠線をグレーに設定
                  width: 4, // 枠線の幅
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // 薄い影
                    blurRadius: 10,
                    offset: const Offset(0, 5), // 影の位置
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "装飾テスト",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
