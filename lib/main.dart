import 'package:flutter/material.dart';
import 'package:todo_app/pages/events_page.dart';
import 'package:todo_app/pages/tasks_page.dart';
import 'package:todo_app/widgets/custom_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Poppins',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            right: 0,
            child: Text(
              '4',
              style: TextStyle(
                fontSize: 200,
                fontWeight: FontWeight.bold,
                color: Color(0x10000000),
              ),
            ),
          ),
          _mainContent()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 72,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Wednesday',
            style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: _renderButtons(),
        ),
        Expanded(
          child: EventsPage(),
        )
      ],
    );
  }

  Widget _renderButtons() {
    return Row(
      children: <Widget>[
        Expanded(
          child: CustomButton(
            text: 'Tasks',
            onPressed: () {},
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
          ),
        ),
        SizedBox(
          width: 32,
        ),
        Expanded(
          child: CustomButton(
            text: 'Events',
            onPressed: () {},
            color: Colors.white,
            textColor: Theme.of(context).accentColor,
            borderColor: Theme.of(context).accentColor,
          ),
        )
      ],
    );
  }
}
