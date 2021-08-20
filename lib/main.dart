import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Domotic App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My Home'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const double margin = 16.0;
  static const double gutter = 8.0;

  List<String> quickAccess = ['20%', 'Front Door Unlocked', 'Garage Door Open', '3 Lights On', 'Kitchen Light'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Icon(Icons.add, size: 30,),
        ],
        leading: Icon(Icons.home_outlined),
      ),
      backgroundColor: Colors.cyan,
      body: ListView(
        padding: const EdgeInsets.only(left: margin),
        children: [
          Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: this.quickAccess.length,
              itemBuilder: (BuildContext context, int index) => Container(
                width: 100,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 75,
                        child: Image.asset('assets/lock.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        this.quickAccess[index],
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: gutter),
                child: Text(
                  'Favorite Scenes',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width * 2,
                child: GridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.horizontal,
                  childAspectRatio: 0.4,
                  children: List.generate(
                    6,
                    (index) => Container(
                      margin: EdgeInsets.all(gutter),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            child: Image.asset('assets/lock.png'),
                          ),
                          Text(
                            'Scene name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: gutter),
                child: Text(
                  'Favorite Accessories',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Container(
                height: 500,
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  children: List.generate(
                    9,
                    (index) => Container(
                      margin: EdgeInsets.all(gutter),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(gutter),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              child: Image.asset('assets/lock.png'),
                            ),
                            Text(
                              'Text spanning 2 lines',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: gutter),
                              child: Text(
                                'status',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
