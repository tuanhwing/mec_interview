
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app_interview/bloc/bloc_factory.dart';
import 'package:flutter_app_interview/bloc/mec_page_bloc.dart';
import 'package:flutter_app_interview/ui/common/mec_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MECPageState<Bloc extends MECPageBloc, Stateful extends StatefulWidget> extends State<Stateful> {
  Bloc _bloc;

  Bloc get bloc => _bloc;
  Widget get content;
  void onPostFrame() {}

  void _onErrorTap() {
    _bloc.pageSTC.add(null);
  }

  @override
  void initState() {
    super.initState();

    _bloc = BlocFactory.of<Bloc>(context: context);
    SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
      onPostFrame();
    });
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Bloc>.value(
      value: bloc,
      child: MECPage(
        onErrorTap: _onErrorTap,
        stream: _bloc.pageStream,
        body: content,
      ),
    );
  }

}