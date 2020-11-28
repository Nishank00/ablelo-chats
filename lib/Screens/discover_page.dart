import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3f7b82),
        centerTitle: true,
        title: Text("Discover Page"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10.0)),
              Text(
                "Nearby Shops",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
                //textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 10.0),
                height: 300,
                color: Colors.white,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            margin: EdgeInsets.only(left: 10, right: 10),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            height: 250,
                            width: 300,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Shop $index"),
                        ],
                      );
                    }),
              ),
              Divider(
                thickness: 2.0,
              ),
              Text(
                'Brands',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              Container(
                //color: Colors.red,
                height: 100,
                margin: EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.amber,
                            ),
                            Text("Shop $index"),
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2.0,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Featured",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                //textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 10.0),
                height: 150,
                color: Colors.white,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            height: 100,
                            width: 100,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Shop $index"),
                        ],
                      );
                    }),
              ),
              Divider(
                thickness: 2.0,
              ),
              Text(
                "Nearby Shops",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                //textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 10.0),
                height: 250,
                color: Colors.white,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            height: 150,
                            width: 300,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Shop $index"),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
