import 'package:flutter/material.dart';

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            children: <Widget>[
              _buildUncompletedTask('Call Tom about appointment'),
              _buildUncompletedTask('Fix on boarding experience'),
              _buildUncompletedTask('Edit API documentation'),
              _buildUncompletedTask('Set up user focus group')
            ],
          ),
        ),
        Divider(
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            children: <Widget>[
              _buildCompletedTask('Have coffee with Sam'),
              _buildCompletedTask('Meet with Sales')
            ],
          ),
        )
      ],
    );
  }

  Widget _buildUncompletedTask(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.radio_button_unchecked,
            color: Theme.of(context).accentColor,
            size: 24.0,
          ),
          SizedBox(
            width: 16.0,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16.0),
          )
        ],
      ),
    );
  }

  Widget _buildCompletedTask(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.radio_button_checked,
            color: Theme.of(context).accentColor,
            size: 24.0,
          ),
          SizedBox(
            width: 16.0,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16.0),
          )
        ],
      ),
    );
  }

  Widget _renderButtons() {
    return Row(
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text('Tasks'),
          ),
        ),
        SizedBox(
          width: 32,
        ),
        Expanded(
          child: MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).accentColor),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            color: Colors.white,
            textColor: Theme.of(context).accentColor,
            child: Text('Events'),
          ),
        )
      ],
    );
  }
}
