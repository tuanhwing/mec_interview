

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/core/mec_hardware_back_observer.dart';
import 'package:flutter_app_interview/core/mec_navigator.dart';
import 'package:flutter_app_interview/core/mec_page_state.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/add/home_add_screen.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/profile/home_profile_screen.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/root/bloc/home_bloc.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/root/bloc/home_event.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/root/bloc/home_state.dart';
import 'package:flutter_app_interview/utils/mec_colors.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootHomeState();
}

class _RootHomeState extends MECPageState<HomeBloc, RootHomeScreen> with SingleTickerProviderStateMixin implements MECHardwareBackListener  {

  TabController _tabController;

  List<Widget> _widgets = <Widget>[
    Center(child: Text('1'),),
    Center(child: Text('2'),),
    HomeAddScreen(),
    Center(child: Text('4'),),
    HomeProfileScreen(),
  ];

  @override
  void onTapBackPlatform() {
    MECNavigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _widgets.length, initialIndex: bloc.state.tabIndex);
    MECHardwareBackObserver().addListener(this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    MECHardwareBackObserver().removeListener(this);
    super.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>.value(
      value: bloc,
      child: BlocListener<HomeBloc, HomeState>(
        listener: (_, state) {
          if (state.tabIndex != _tabController.index) {
            _tabController.animateTo(state.tabIndex);
          }
        },
        child: Scaffold(
            body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: _widgets
            ),
            bottomNavigationBar: _HomeBottomNavigationBar()
        ),
      ),
    );
  }

  @override
  Widget get content => throw UnimplementedError();
}

class _HomeBottomNavigationBar extends StatelessWidget {

  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.search,
    Icons.add,
    Icons.messenger_outline,
    Icons.person_outline_outlined
  ];

  List<BottomNavigationBarItem> _buildNavigationBar(HomeState state) {
    List<BottomNavigationBarItem> _items = [];
    for(int index=0; index<5; index++) {
      _items.add(BottomNavigationBarItem(
        icon: state.tabIndex == index ? Container(
          constraints: BoxConstraints(maxWidth: 7*MECDimensions.DIMENSION_10, maxHeight: MECDimensions.DIMENSION_8*MECDimensions.DIMENSION_5),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(1.0, 1.0),
              colors: <Color>[
                Color(0xffFF00D6),
                Color(0xffFF4D00)
              ], // red to yellow
              tileMode: TileMode.repeated
            ),
            borderRadius: BorderRadius.all(Radius.circular(4*MECDimensions.DIMENSION_5)),
            color: MECColors.red
          ),
          child: Icon(
            _icons[index],
            color: MECColors.white,
          ),
        ) : Icon(
          _icons[index],
          color: MECColors.black,
        ),
        label: '',
      ));
    }
    return _items;
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black.withOpacity(0.1), width: MECDimensions.DIMENSION_2))),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: _buildNavigationBar(state),
            currentIndex: state.tabIndex,
            onTap: (index) => context.read<HomeBloc>().add(HomeTabChangedEvent(index: index)),
          ),
        );
      },
    );
  }
}