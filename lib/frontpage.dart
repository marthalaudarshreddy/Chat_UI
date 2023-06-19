import 'package:chat/chat_file.dart';
import 'package:chat/messages.dart';
import 'package:flutter/material.dart';

import 'messagecontainer.dart';

int selected_index = 0;
List<String> top = ["Message", "Option", "Search", "final"];
List<String> names = ["Charlie", "Eddie", "Lamos", "Arsoi", "Fillmioi"];
List<String> url = ["one.jpg", "tow.jpg", "three.jpg", "four.jpg", "five.jpg"];
final one = messagesoi(
    imageid: "images/four.jpg",
    isviewd: true,
    message: "hey,how are u?",
    name: "Arsoi",
    timestamp: "14:25");
final two = messagesoi(
    imageid: "images/three.jpg",
    isviewd: false,
    message: "would you come to date",
    name: "Fillmioi",
    timestamp: "17:25");
final throi = messagesoi(
    imageid: "images/five.jpg",
    isviewd: false,
    message: "nice to meet you",
    name: "Eddie",
    timestamp: "16:25");
final four = messagesoi(
    imageid: "images/three.jpg",
    isviewd: true,
    message: "nice to meet you",
    name: "Eddie",
    timestamp: "16:25");
final five = messagesoi(
    imageid: "images/tow.jpg",
    isviewd: false,
    message: "meet me firend",
    name: "joesph",
    timestamp: "16:25");
final six = messagesoi(
    imageid: "images/four.jpg",
    isviewd: false,
    message: "talk to firens",
    name: "raju",
    timestamp: "16:25");
final sevoi = messagesoi(
    imageid: "images/one.jpg",
    isviewd: true,
    message: "my firend",
    name: "tarun",
    timestamp: "16:5");
List<messagesoi> totalchats = [one, two, throi, four, five, six, sevoi];

class frontpage extends StatefulWidget {
  const frontpage({super.key});

  @override
  State<frontpage> createState() => _frontpageState();
}

class _frontpageState extends State<frontpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        leading: Icon(Icons.format_align_center_rounded),
        title: Text("chat"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            width: double.infinity,
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: top.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 34, horizontal: 30),
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected_index = index;
                        });
                      },
                      child: Text(
                        top[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: selected_index == index
                              ? Colors.white
                              : Colors.white60,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            width: double.infinity,
            height: 190,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Favorites",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.black54,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: names.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    minRadius: 41,
                                    backgroundImage:
                                        AssetImage("images/" + url[index]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 1),
                                    child: Text(
                                      names[index],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: totalchats.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (totalchats[index].isviewd == false) {
                          setState(() {
                            totalchats[index].isviewd = true;
                            print(totalchats[index].isviewd);
                          });
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => chatfile(),
                            ));
                      },
                      child: messagecontainer(
                        total: totalchats[index],
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.white,
                      Colors.white.withOpacity(.8),
                      Colors.white.withOpacity(.4),
                      Colors.white.withOpacity(0)
                    ],
                  )),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
