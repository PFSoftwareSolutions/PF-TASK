import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Contrller for text field
  TextEditingController textController = TextEditingController();

  // List of task
  var tasks = [
    {"task": "Buy Milk", "createdTime": "2022-01-10 22:10:11.348"},
    {"task": "Buy Car", "createdTime": "2022-01-10 22:10:11.348"}
  ];

  //Function to add new task
  void addNewTask(task) {
    tasks.add(task);
    setState(() {});
  }

  //Function to delete the already existing task

  void deleteTask(index) {
    tasks.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PF-TASK",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          (tasks.isNotEmpty)
              ? ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tasks[index]["task"].toString(),
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              deleteTask(index);
                            },
                            icon: const Icon(
                              Icons.delete_outlined,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "Hurray! No Taks",
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.76,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        controller: textController,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 20.0),
                            hintText: 'e.g. Buy milk',
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.black,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (textController.text.isNotEmpty) {
                          addNewTask({
                            "task": textController.text,
                            "createdTime": DateTime.now().toString()
                          });
                          textController.text = "";
                        }
                      },
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
