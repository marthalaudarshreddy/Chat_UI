import 'package:chat/messages.dart';
import 'package:flutter/material.dart';

class messagecontainer extends StatefulWidget {
  messagesoi total;
  messagecontainer({super.key, required this.total});

  @override
  State<messagecontainer> createState() => _messagecontainerState();
}

class _messagecontainerState extends State<messagecontainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.total.isviewd == true
              ? Colors.white
              : Color.fromARGB(255, 246, 218, 227),
        ),
        width: double.infinity,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    minRadius: 41,
                    backgroundImage: AssetImage(widget.total.imageid!),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.total.name!),
                        Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: Text(widget.total.message!),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.total.timestamp!),
                    Padding(
                      padding: const EdgeInsets.only(top: 14, right: 15),
                      child: Visibility(
                        visible: widget.total.isviewd == true ? false : true,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Visibility(
                              child: Text(
                                "New",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
