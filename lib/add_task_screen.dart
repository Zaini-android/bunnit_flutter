import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../cons.dart';

class AddTaskWidget extends StatefulWidget {
  @override
  _AddTaskWidgetState createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  TextEditingController textController = TextEditingController();
  List<Map<dynamic, dynamic>> tickList = [
    {"icon": FontAwesomeIcons.carrot, "task": "Eat a Healthy Meal"},
    {"icon": FontAwesomeIcons.pen, "task": "Do Your Homework"},
    {"icon": FontAwesomeIcons.dog, "task": "Walk the Dog"},
    {"icon": FontAwesomeIcons.wineGlass, "task": "Drink a Smoothie"},
    {"icon": FontAwesomeIcons.capsules, "task": "Take Vitamins"},
    {"icon": FontAwesomeIcons.camera, "task": "Take a Photo"},
  ];
  List<Map<dynamic, dynamic>> heartList = [
    {"icon": FontAwesomeIcons.walking, "task": "Walk or Run"},
    {"icon": FontAwesomeIcons.shoePrints, "task": "Stand Minutes"},
    {"icon": FontAwesomeIcons.swimmer, "task": "Swim"},
    {"icon": FontAwesomeIcons.hiking, "task": "Climb Flights"},
    {"icon": FontAwesomeIcons.shoePrints, "task": "Stand Hours"},
    {"icon": FontAwesomeIcons.bicycle, "task": "Cycle"},
  ];
  List<Map<dynamic, dynamic>> foodList = [
    {"icon": FontAwesomeIcons.tint, "task": "Drink Water"},
    {"icon": FontAwesomeIcons.gripfire, "task": "Energy Deficit"},
    {"icon": FontAwesomeIcons.mugHot, "task": "Drink Coffee"},
    {"icon": FontAwesomeIcons.hiking, "task": "Climb Flights"},
    {"icon": FontAwesomeIcons.hamburger, "task": "Eat Burger"},
    {"icon": FontAwesomeIcons.iceCream, "task": "Eat Ice-cream"},
  ];
  List<Map<dynamic, dynamic>> timeList = [
    {"icon": FontAwesomeIcons.guitar, "task": "Practice Guitar"},
    {"icon": FontAwesomeIcons.mobile, "task": "Active Blue Filter Light"},
    {"icon": FontAwesomeIcons.broom, "task": "Clean the Room"},
    {"icon": FontAwesomeIcons.brush, "task": "Brush the Teeth"},
    {"icon": FontAwesomeIcons.video, "task": "Watch Movie"},
    {"icon": FontAwesomeIcons.bed, "task": "Sleep Early"},
  ];
  List<Map<dynamic, dynamic>> dontList = [
    {"icon": FontAwesomeIcons.smokingBan, "task": "No Smoke Today"},
    {"icon": FontAwesomeIcons.cloudMeatball, "task": "Don't Eat Junk Food"},
    {"icon": FontAwesomeIcons.handPaper, "task": "Don't Bite Nails"},
    {"icon": FontAwesomeIcons.redditAlien, "task": "Don't Lie"},
    {"icon": FontAwesomeIcons.wineGlass, "task": "Don't Drink Alcohol"},
    {"icon": FontAwesomeIcons.coffee, "task": "Don't take Sugar"},
  ];
  int index = 0;
  var _selectedDate = "Select Date";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Task",
          style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading:  GestureDetector(onTap: (){Navigator.pop(context);}, child: Icon(Icons.close)),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: LightColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        index = 0;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 0 ? ActiveColor : Colors.white),
                        padding: const EdgeInsets.all(10),
                        child: FaIcon(
                          FontAwesomeIcons.check,
                          color: index == 0 ? Colors.white : ActiveColor,
                          size: 22,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        index = 1;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 1 ? ActiveColor : Colors.white),
                        padding: const EdgeInsets.all(10),
                        child: FaIcon(
                          FontAwesomeIcons.heart,
                          color: index == 1 ? Colors.white : ActiveColor,
                          size: 22,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        index = 2;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 2 ? ActiveColor : Colors.white),
                        padding: const EdgeInsets.all(10),
                        child: FaIcon(
                          FontAwesomeIcons.utensils,
                          color: index == 2 ? Colors.white : ActiveColor,
                          size: 22,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        index = 3;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 3 ? ActiveColor : Colors.white),
                        padding: const EdgeInsets.all(10),
                        child: FaIcon(
                          FontAwesomeIcons.clock,
                          color: index == 3 ? Colors.white : ActiveColor,
                          size: 22,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        index = 4;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 4 ? ActiveColor : Colors.white),
                        padding: const EdgeInsets.all(10),
                        child: FaIcon(
                          FontAwesomeIcons.ban,
                          color: index == 4 ? Colors.white : ActiveColor,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
                child: Text(
                  "Tasks start each day as pending. Mark a as task completed to earn points.",
                  style: TextStyle(
                      fontFamily: "Poppins", fontWeight: FontWeight.w600),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "CREATE YOUR OWN TASK",
                  style: TextStyle(
                      fontFamily: "Poppins", fontWeight: FontWeight.w700),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return AlertDialog(
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "CREATE YOUR OWN TASK",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: textController,
                                  decoration: const InputDecoration(
                                      hintText: "Add Title",
                                      labelText: "Add Title"),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 11),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(_selectedDate),
                                      GestureDetector(
                                        onTap: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2030),
                                          ).then((pickedDate) {
                                            if (pickedDate == null) {
                                              return;
                                            }
                                            setState(() {
                                              _selectedDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickedDate);
                                              //yyyy/mm//dd
                                              print(_selectedDate);
                                            });
                                          });
                                        },
                                        child: const Icon(
                                          Icons.calendar_today_sharp,
                                          color: ActiveColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    //custom task
                                    String title = textController.text.trim();
                                    addTasks(_selectedDate, title);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    color: ActiveColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 20),
                                    child: const Center(
                                        child: Text(
                                      "Add Task",
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                      });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.1),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Start with your own task title...",
                      style: TextStyle(
                          fontFamily: "Poppins", fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "OR CHOOSE OUR OWN PRE-DEFINED TASKS:",
                  style: TextStyle(
                      fontFamily: "Poppins", fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  border: Border(
                      top: BorderSide(
                          width: 1, color: Colors.black.withOpacity(0.2)),
                      bottom: BorderSide(
                          width: 1, color: Colors.black.withOpacity(0.2))),
                ),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: index == 0
                        ? tickList.length
                        : index == 1
                            ? heartList.length
                            : index == 2
                                ? foodList.length
                                : index == 3
                                    ? timeList.length
                                    : dontList.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return AlertDialog(
                                      content: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            "Task Title",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 11),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5))),
                                              child: Text(index == 0
                                                  ? tickList[i]["task"]
                                                  : index == 1
                                                      ? heartList[i]["task"]
                                                      : index == 2
                                                          ? foodList[i]["task"]
                                                          : index == 3
                                                              ? timeList[i]
                                                                  ["task"]
                                                              : dontList[i]
                                                                  ["task"])),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 11),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(5))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(_selectedDate),
                                                GestureDetector(
                                                  onTap: () {
                                                    showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime.now(),
                                                      lastDate: DateTime(2030),
                                                    ).then((pickedDate) {
                                                      if (pickedDate == null) {
                                                        return;
                                                      }
                                                      setState(() {
                                                        _selectedDate =
                                                            DateFormat(
                                                                    'yyyy-MM-dd')
                                                                .format(
                                                                    pickedDate);
                                                        //yyyy/mm//dd
                                                        print(_selectedDate);
                                                      });
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.calendar_today_sharp,
                                                    color: ActiveColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              addTasks(
                                                  _selectedDate,
                                                  index == 0
                                                      ? tickList[i]["task"]
                                                      : index == 1
                                                          ? heartList[i]["task"]
                                                          : index == 2
                                                              ? foodList[i]
                                                                  ["task"]
                                                              : index == 3
                                                                  ? timeList[i]
                                                                      ["task"]
                                                                  : dontList[i]
                                                                      ["task"]);
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              color: ActiveColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 20),
                                              child: const Center(
                                                  child: Text(
                                                "Add Task",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                                });
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 5, left: 20),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Colors.black.withOpacity(0.07),
                                    child: FaIcon(
                                      index == 0
                                          ? tickList[i]["icon"]
                                          : index == 1
                                              ? heartList[i]["icon"]
                                              : index == 2
                                                  ? foodList[i]["icon"]
                                                  : index == 3
                                                      ? timeList[i]["icon"]
                                                      : dontList[i]["icon"],
                                      color: ActiveColor,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        index == 0
                                            ? tickList[i]["task"]
                                            : index == 1
                                                ? heartList[i]["task"]
                                                : index == 2
                                                    ? foodList[i]["task"]
                                                    : index == 3
                                                        ? timeList[i]["task"]
                                                        : dontList[i]["task"],
                                        style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: ActiveColor,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  String Pending = 'Pending';
  void addTasks(String selectedDate, String textController) {
    showLoaderDialog(context);
    Navigator.pop(context);
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Tasks')
        .doc()
        .set({
      "Title": textController,
      "getDate": selectedDate,
      "status": Pending
    }, SetOptions(merge: true));

    Navigator.pop(context);
    const snackBar = SnackBar(
      content: Text(
        'Your task has been added',
        style: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
      ),
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showLoaderDialog(BuildContext context) {
    showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: SizedBox(
            height: 65,
            width: 65,
            child: Center(
              child: CircularProgressIndicator(
                color: ActiveColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
