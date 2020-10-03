import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'events/screens/add_events_screen.dart';
import 'events/widgets/events_list.dart';
import 'tasks/Widgets/tasks_list.dart';
import 'tasks/screens/add_task_screen.dart';
import 'models.dart';
import 'widgets/custom_button.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<PageType, AppPage> _pages = {
    PageType.Tasks: AppPage(
      name: 'Tasks',
      pageType: PageType.Tasks,
      component: TasksList(),
      newItemPage: AddTaskScreen(),
    ),
    PageType.Events: AppPage(
      name: 'Events',
      pageType: PageType.Events,
      component: EventList(),
      newItemPage: AddEventScreen(),
    )
  };
  PageType _selectedPage = PageType.Tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 6,
              color: Theme.of(context).accentColor,
            ),
            Positioned(
              top: -48,
              right: 0,
              child: Text(
                DateFormat.d().format(DateTime.now()),
                style: TextStyle(
                  fontSize: 200,
                  color: Color(0x10000000),
                ),
              ),
            ),
            _mainContent()
          ],
        ),
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
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).disabledColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).disabledColor,
              ),
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
        Padding(
          padding:
              EdgeInsets.only(left: 24.0, top: 48.0, bottom: 16.0, right: 8.0),
          child: Text(
            DateFormat.EEEE().format(DateTime.now()),
            style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(24.0),
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

  Widget _renderButton(AppPage page) {
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
