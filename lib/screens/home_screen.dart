import 'package:bunnit_flutter/cons.dart';
import 'package:bunnit_flutter/constants.dart';
import 'package:bunnit_flutter/screens/add_task_screen.dart';
import 'package:bunnit_flutter/theme/colors/light_colors.dart';
import 'package:bunnit_flutter/widgets/task_column.dart';
import 'package:bunnit_flutter/widgets/top_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:table_calendar/table_calendar.dart';

import '../add_task_screen.dart';
import 'login_screen.dart';

class HomePage extends StatefulWidget {
//// Add task button
  static CircleAvatar calendarIcon() {
    return const CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Image(
        image: AssetImage(
          'images/schedule.png',
        ),
        width: 30,
        height: 30,
      ),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Text subheading(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  String username = '';
  String email = '';

  int totTasks = 0;
  void pendingTask() async {
    QuerySnapshot _myDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Tasks')
        .get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    totTasks = _myDocCount.length;
    print(_myDocCount.length); // Co
    setState(() {}); // unt of Documents in Collection
  }

  int totTasksDone = 0;
  void totTaskDone() async {
    QuerySnapshot _myDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Tasks')
        .where('status', isEqualTo: 'Completed')
        .get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    totTasksDone = _myDocCount.length;
    print("These are the Completed Tasks${_myDocCount.length}");
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(
            {'totalPoints': totTasksDone * 100}, SetOptions(merge: true)); // Co
    setState(() {}); // unt of Documents in Collection
  }

  DateTime? dateToday;

  GetDate() async {
    dateToday =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    focusDayGet = dateToday.toString().substring(0, 10);
    setState(() {});
  }

  String? focusDayGet;

  getUserInfo() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) => {
              username = value.get('name'),
              email = value.get('email'),
            });
    setState(() {});
  }

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDays = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDays = _focusedDay;
    GetDate();
    getUserInfo();
    pendingTask();
    totTaskDone();
    print(focusDayGet);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 150,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            const snackBar = SnackBar(
                              content:
                                  Text('Complete Your Task to Earn Points'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: Row(
                            children: [
                              Text(
                                "${totTasksDone * 100}",
                                style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'images/Logo.png',
                                height: 30,
                                width: 30,
                              ),

                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            logout(context);
                          },
                          child: const Icon(Icons.logout,
                              color: LightColors.kDarkBlue, size: 25.0),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: <Widget>[
                          //     Text(
                          //       username,
                          //       textAlign: TextAlign.start,
                          //       style: const TextStyle(
                          //           fontSize: 28.0,
                          //           color: LightColors.kDarkBlue,
                          //           fontWeight: FontWeight.w800,
                          //           fontFamily: "Poppins",
                          //           letterSpacing: 1.5),
                          //     ),
                          //     Text(
                          //       email,
                          //       textAlign: TextAlign.start,
                          //       style: const TextStyle(
                          //           fontSize: 18.0,
                          //           color: Colors.black45,
                          //           fontWeight: FontWeight.w400,
                          //           fontFamily: "Poppins",
                          //           letterSpacing: 1),
                          //     ),
                          //   ],
                          // )
                          Image.asset("images/bunnit_logo_black.png",width: 100,height: 100,)
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('My Tasks'),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddTaskWidget()),
                                  );
                                },
                                child: HomePage.calendarIcon(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: TableCalendar(
                        selectedDayPredicate: (day) =>
                            isSameDay(day, _selectedDays),
                        calendarFormat: CalendarFormat.week,
                        onDaySelected:
                            (DateTime selectedDay, DateTime focusedDay) {
                          setState(() {
                            _selectedDays = selectedDay;
                            print(_selectedDays);
                            _focusedDay = selectedDay;
                            focusDayGet =
                                _focusedDay.toString().substring(0, 10);
                            print(_focusedDay);
                            print(focusDayGet);
                          });
                        },
                        // initialCalendarFormat: CalendarFormat.week,
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: _focusedDay,
                        // focusedDay: DateTime.now(),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection('Tasks')
                            .where('getDate', isEqualTo: focusDayGet)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          return snapshot.connectionState ==
                                  ConnectionState.waiting
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    // backgroundColor: kPrimaryColor,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        LightColors.kDarkYellow),
                                  ),
                                )
                              : snapshot.data!.docs.isEmpty
                                  ? const Center(child: Text('No Data Found'))
                                  : ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        DocumentSnapshot data =
                                            snapshot.data!.docs[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.12,
                                            child: Card(
                                              elevation: 3,
                                              shape: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide.none),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                        child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Text(
                                                          data.get('Title')),
                                                    )),
                                                    GestureDetector(
                                                      onTap:
                                                          data.get('status') ==
                                                                  'Completed'
                                                              ? () {}
                                                              : () {
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return DialogBox(
                                                                            context,
                                                                            data);
                                                                      });
                                                                  // markRead(data.id, context);
                                                                },
                                                      child:
                                                          data.get('status') ==
                                                                  'Completed'
                                                              ? Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: data.get('status') ==
                                                                            'Completed'
                                                                        ? ActiveColor
                                                                        : Colors
                                                                            .deepOrangeAccent
                                                                            .withOpacity(0.4),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: data.get('status') ==
                                                                            'Completed'
                                                                        ? FaIcon(
                                                                            FontAwesomeIcons.check,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                22,
                                                                          )
                                                                        : FaIcon(
                                                                            FontAwesomeIcons.check,
                                                                            color:
                                                                                ActiveColor,
                                                                            size:
                                                                                22,
                                                                          ),
                                                                  ),
                                                                )
                                                              : Container(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      border: Border.all(
                                                                          color:
                                                                              ActiveColor)),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: data.get('status') ==
                                                                            'Completed'
                                                                        ? FaIcon(
                                                                            FontAwesomeIcons.check,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                22,
                                                                          )
                                                                        : FaIcon(
                                                                            FontAwesomeIcons.check,
                                                                            color:
                                                                                ActiveColor,
                                                                            size:
                                                                                22,
                                                                          ),
                                                                  ),
                                                                ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog DialogBox(BuildContext context, DocumentSnapshot<Object?> data) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Mark as Completed"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: LightColors.kDarkYellow),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'No',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: ActiveColor),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: LightColors.kDarkYellow),
                    child: GestureDetector(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection('Tasks')
                              .doc(data.id)
                              .set({
                            'status': "Completed",
                          }, SetOptions(merge: true));

                          totTaskDone();
                          setState(() {});

                          Navigator.pop(context);
                          print('Task Completed');
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
