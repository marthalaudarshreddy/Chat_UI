import 'package:chat/personal_chat.dart';
import 'package:flutter/material.dart';

TextEditingController contoi = TextEditingController();
List<personalmessage> koioioi = [
  personalmessage(isme: true, message: "hi,how are you i am file"),
  personalmessage(isme: false, message: "yeadh, i am fine"),
  personalmessage(isme: false, message: "how are you?"),
  personalmessage(isme: true, message: "did you finish the work?"),
  personalmessage(isme: false, message: "no i did not finish the work"),
  personalmessage(isme: true, message: "oh,nice of you"),
  personalmessage(isme: true, message: "did you attend the meeting"),
  personalmessage(isme: false, message: "no i did not attend the meeting")
];

class chatfile extends StatefulWidget {
  const chatfile({super.key});

  @override
  State<chatfile> createState() => _chatfileState();
}

class _chatfileState extends State<chatfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        leading: Icon(Icons.chevron_left_rounded),
        title: Text("chats"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: Color.fromARGB(255, 246, 245, 240),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 700,
                child: ListView.builder(
                  itemCount: koioioi.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: koioioi[index].isme == true
                          ? const EdgeInsets.only(left: 150, bottom: 20)
                          : EdgeInsets.only(right: 150, bottom: 20, left: 2),
                      child: Container(
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: koioioi[index].isme == true
                                ? Colors.pink
                                : Colors.green[300]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 4),
                          child: Text(
                            koioioi[index].message!,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  },
                )),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(right: 20),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.search),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 10),
                      child: Container(
                          width: 300,
                          child: TextField(
                            controller: contoi,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.attach_file),
                                hintText: "enter the text",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          )),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            String text = contoi.text.toString();
                            koioioi.add(
                                personalmessage(isme: true, message: text));
                            contoi.text = "";
                          });
                          ;
                        },
                        icon: Icon(Icons.send))
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
