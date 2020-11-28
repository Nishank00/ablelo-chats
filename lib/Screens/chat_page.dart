import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String text;
  var chatController = TextEditingController();

  final List<Message> messages = [
    Message(0,
        "But I may not go if the weather is bad. So lets see the weather condition 😀"),
    Message(0, "I suppose I am."),
    Message(1, "Are you going to market today?"),
    Message(0, "I am good too"),
    Message(1, "I am fine, thank you. How are you? "),
    Message(1, "Hi,"),
    Message(0, "How are you today?"),
    Message(0, "Hello,"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3f7b82),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 25,
          )
        ],
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: Text(
          "Ashish Sharma",
          style: TextStyle(
              fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0))),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10.0);
                  },
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    Message m = messages[index];
                    if (m.user == 0) return _buildMessageRow(m, current: true);
                    return _buildMessageRow(m, current: false);
                  },
                ),
              ),
            ),
            _buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  //Widgets
  Container _buildBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      //color: Colors.white,
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: Card(
              margin: EdgeInsets.only(left: 15, right: 15),
              elevation: 11,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    suffixIcon: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // added line
                      mainAxisSize: MainAxisSize.min, // added line
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.attach_file,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Colors.tealAccent,
                            ),
                            onPressed: () {})
                      ],
                    ),
                    hintText: "Type a message",
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xff999999),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
              ),
            ),
          )
        ],
      ),
    );
  }

  // _save() async {
  //   if (chatController.text.isEmpty) return;
  //   FocusScope.of(context).requestFocus(FocusNode());
  //   setState(() {
  //     messages.insert(0, Message(rand.nextInt(2), _controller.text));
  //     chatController.clear();
  //   });
  // }

  Row _buildMessageRow(Message message, {bool current}) {
    return Row(
      mainAxisAlignment:
          current ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment:
          current ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: current ? 30.0 : 20.0),
        if (!current) ...[
          CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 25.0,
          ),
          const SizedBox(width: 5.0),
        ],

        ///Chat bubbles
        Container(
          padding: EdgeInsets.only(
            bottom: 5,
            right: 5,
          ),
          child: Column(
            crossAxisAlignment:
                current ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                  minHeight: 40,
                  maxHeight: 250,
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                  minWidth: MediaQuery.of(context).size.width * 0.1,
                ),
                decoration: BoxDecoration(
                  color: current ? Colors.red : Color(0xff323232),
                  gradient: current
                      ? LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xff3f7b82), Color(0xff3f7b82)])
                      : LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xff999999), Color(0xff999999)]),
                  borderRadius: current
                      ? BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )
                      : BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 10, bottom: 5, right: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: current
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          message.description,
                          style: TextStyle(
                            color: current ? Colors.white : Colors.white,
                          ),
                        ),
                      ),
                      // Icon(
                      //   Icons.done_all,
                      //   color: Colors.white,
                      //   size: 14,
                      // )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "2:02",
                style: TextStyle(
                    fontSize: 12, color: Colors.black.withOpacity(0.5)),
              )
            ],
          ),
        ),
        if (current) ...[
          const SizedBox(width: 5.0),
        ],
        SizedBox(width: current ? 20.0 : 30.0),
      ],
    );
  }
}

class Message {
  final int user;
  final String description;

  Message(this.user, this.description);
}
