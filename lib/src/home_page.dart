import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'add_event_page.dart';
import 'add_task_page.dart';
import 'events_page.dart';
import 'models.dart';
import 'tasks_page.dart';
import 'widgets/custom_button.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<PageType, Page> _pages = {
    PageType.Tasks: new Page(
      name: 'Tasks',
      pageType: PageType.Tasks,
      component: TasksPage(),
      newItemPage: AddTaskPage(),
    ),
    PageType.Events: new Page(
      name: 'Events',
      pageType: PageType.Events,
      component: EventsPage(),
      newItemPage: AddEventPage(),
    )
  };
  PageType _selectedPage = PageType.Tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            right: 0,
            child: Text(
              new DateFormat.d().format(new DateTime.now()),
              style: TextStyle(
                fontSize: 200,
                color: Color(0x10000000),
              ),
            ),
          ),
          _mainContent()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: _pages[_selectedPage].newItemPage,
              );
            },
          );
        },
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
            new DateFormat.EEEE().format(new DateTime.now()),
            style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: _renderButton(_pages[PageType.Tasks]),
              ),
              SizedBox(
                width: 32,
              ),
              Expanded(
                child: _renderButton(_pages[PageType.Events]),
              )
            ],
          ),
        ),
        Expanded(
          child: _pages[_selectedPage].component,
        )
      ],
    );
  }

  Widget _renderButton(Page page) {
    bool isSelected = page.pageType == _selectedPage;

    return CustomButton(
      text: page.name,
      onPressed: () {
        setState(() {
          _selectedPage = page.pageType;
        });
      },
      color: isSelected ? Theme.of(context).accentColor : Colors.white,
      textColor: isSelected ? Colors.white : Theme.of(context).accentColor,
      borderColor:
          isSelected ? Colors.transparent : Theme.of(context).accentColor,
    );
  }
}
