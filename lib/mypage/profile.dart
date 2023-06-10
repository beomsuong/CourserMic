import 'package:capston/mypage/my_user.dart';
import 'package:capston/palette.dart';
import 'package:capston/widgets/GradientText.dart';
import 'package:capston/widgets/RoundButtonStyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:capston/mypage/addDialog.dart';

class Profile extends StatefulWidget {
  final String userID;
  final bool bChild;
  final bool bMyProfile;
  const Profile(
      {super.key,
      required this.userID,
      this.bChild = true,
      this.bMyProfile = false});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  late MyUser myUser;
  late DocumentReference userDocRef;

  Future<DocumentSnapshot> readUserData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    userDocRef = firestore.collection('user').doc(widget.userID);
    DocumentSnapshot docSnapshot = await userDocRef.get();

    return docSnapshot;
  }

  SizedBox print_info(String a, String b) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Text(
            ' $a : $b',
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: widget.bChild
              ? const Text(
                  "프로필",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              : const GradientText(text: "프로필"),
          centerTitle: true,
          elevation: 0.5,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: !widget.bMyProfile,
          leading: widget.bChild
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_rounded,
                      color: Palette.darkGray),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : null),
      body: FutureBuilder<DocumentSnapshot>(
          future: readUserData(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            myUser = MyUser.fromJson(snapshot.data!);

            return ListView(
              children: <Widget>[
                SizedBox(
                  height: widget.bMyProfile ? 15 : 30,
                ),
                Align(
                  alignment: Alignment.center, // 가운데 정렬
                  child: SizedBox(
                    child: Material(
                      borderRadius: BorderRadius.circular(50),
                      elevation: 1,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Palette.lightGray,
                        child: CircleAvatar(
                          radius: 49,
                          backgroundImage: NetworkImage(myUser.imageURL),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  myUser.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: widget.bMyProfile ? 5 : 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.person),
                                    SizedBox(
                                      child: Text(
                                        ' 기본 정보',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                if (widget.bMyProfile)
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AddDialog(
                                            myPageState: this,
                                          );
                                        },
                                      ).then((value) {
                                        setState(() {});
                                      });
                                    },
                                    style: buttonStyle,
                                    child: const Text(
                                      '+ 수정',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    print_info("대학교", myUser.university),
                                    const Divider(color: Palette.darkGray),
                                    print_info("학과 ", myUser.department),
                                    const Divider(color: Palette.darkGray),
                                    print_info("MBTI ", myUser.MBTI),
                                    const Divider(color: Palette.darkGray),
                                    print_info("연락 가능 시간 ", myUser.contactTime),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: widget.bMyProfile ? 5 : 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.subject_rounded),
                                    SizedBox(
                                      child: Text(
                                        ' 활동 이력',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // 버튼을 눌렀을 때 실행되는 코드
                                  },
                                  style: buttonStyle,
                                  child: const Text(
                                    '+ 조회',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      child: Row(
                                        children: const [
                                          Text(
                                            '현재 참여중인 과제 : ' 'N' '(개)',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(color: Palette.darkGray),
                                    SizedBox(
                                      height: 30,
                                      child: Row(
                                        children: const [
                                          Text(
                                            '완료한 과제 : ' '0' '(개)',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: widget.bMyProfile ? 5 : 15, bottom: 5),
                      child: const Text(
                        'Level 0',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                    ),
                    LinearPercentIndicator(
                      alignment: MainAxisAlignment.center,
                      width: 280.0,
                      lineHeight: 20.0,
                      leading: const Text(
                        //좌측 문자열 Leading
                        "EXP",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w900),
                      ),
                      trailing: const Text(
                        //우측 문자열 trailing
                        "80%",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w900),
                      ),
                      percent: 0.8,
                      center: const Text("80.0%",
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: Palette.lightGray,
                      linearGradient: const LinearGradient(colors: [
                        Palette.brightViolet,
                        Palette.pastelPurple,
                        Palette.brightBlue
                      ]),
                      animation: true,
                      animationDuration: 2500,
                      barRadius: const Radius.circular(30.0),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
