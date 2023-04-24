import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class GradientText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'CouserMic',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        foreground: Paint()
          ..shader = const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Color.fromARGB(142, 141, 5, 187)],
          ).createShader(
            const Rect.fromLTWH(50.0, 0.0, 200.0, 70.0),
          ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Center(child: Text('첫 번째 페이지')),
    const Center(child: Text('두 번째 페이지')),
    mypage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GradientText(),
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: null,
          icon: Image.asset(
            "assets/image/logo.png",
            fit: BoxFit.contain, // 이미지 크기를 그대로 유지합니다.
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger_outline),
            label: '체팅방',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}

class mypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              child: Text('● 내 프로필',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
            ),
          ),
          Align(
            alignment: Alignment.center, // 가운데 정렬
            child: SizedBox(
              child: Image.asset(
                "assets/image/logo.png",
                fit: BoxFit.contain, // 이미지 크기를 그대로 유지합니다.
              ),
            ),
          ),
          Column(
            children: const [
              Text(
                '이름 예정',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Divider(
                thickness: 2,
                height: 10,
                indent: 70,
                endIndent: 70,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(
                  child: Text(
                    '기본 정보',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  child: Text(
                    '수정버튼 수정 예정',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: Column(
                children: [
                  const Divider(
                    thickness: 2,
                    height: 3,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: const [
                        Text(
                          '대학 :',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '대학교 변수',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: const [
                        Text(
                          '학과 :',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '학과 변수',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: const [
                        Text(
                          'MBTI :',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'MBTI 변수',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: const [
                        Text(
                          '연락 가능 시간 :',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '연락가능 시간 변수',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height: 10,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(
                  child: Text(
                    '활동 이력',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  child: Text(
                    '조회 버튼 추가 예정',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: Column(
                children: [
                  const Divider(
                    thickness: 2,
                    height: 3,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: const [
                        Text(
                          '현재 참여중인 과제 : ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '갯수 변수',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '(개)',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: const [
                        Text(
                          '완료한 과제 : ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '갯수 변수',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '(개)',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height: 10,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            child: SizedBox(
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 7, left: 7),
                    child: Text(
                      'Level : ' '레벨변수',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
