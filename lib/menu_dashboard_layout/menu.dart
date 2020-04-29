import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_and_dashboard/bloc/navigation_bloc/navigation_bloc.dart';

class Menu extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuAnimation;
  final int selectedIndex;
  final Function onMenuItemClicked;

  const Menu({Key key, this.slideAnimation, this.menuAnimation, this.selectedIndex, @required this.onMenuItemClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: menuAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.DashboardClickedEvent);
                    onMenuItemClicked();
                  },
                  child: Text(
                    "Dashboard",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: selectedIndex == 0 ? FontWeight.w900 : FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MessagesClickedEvent);
                    onMenuItemClicked();
                  },
                  child: Text(
                    "Messages",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: selectedIndex == 1 ? FontWeight.w900 : FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.UtilityClickedEvent);
                    onMenuItemClicked();
                  },
                  child: Text(
                    "Utility Bills",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: selectedIndex == 2 ? FontWeight.w900 : FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text("Funds Transfer", style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 30),
                Text("Branches", style: TextStyle(color: Colors.white, fontSize: 22)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
