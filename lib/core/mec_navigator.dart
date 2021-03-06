
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_interview/core/mec_logger.dart';

class MECNavigator {
  static final String _string = "Navigator";

  ///Push a named route onto the navigator.
  ///navigatorState from the closest instance of this class that encloses the given context.
  ///
  /// If `rootNavigator` is set to true, the state from the furthest instance of
  /// this class is given instead. Useful for pushing contents above all subsequent
  /// instances of [Navigator].
  static Future pushNamed<T>(BuildContext context, String routeName, {T arguments, bool useRootNavigator: false}) {
    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    MECLogger.log('$_string pushNamed  $routeName');
    return navigatorState.pushNamed(routeName, arguments: arguments);
  }

  static Future pushRoute(BuildContext context, PageRoute route, {bool useRootNavigator: false}) {
    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    MECLogger.log('$_string pushRoute ${route.toString()}');
    return navigatorState.push(route);
  }

  static T pop<T>(BuildContext context, {T result, bool useRootNavigator: false}) {

    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    if (navigatorState.canPop()) {
      navigatorState.pop(result);
      MECLogger.log('$_string pop with result:$result');
    }
    else {
      SystemNavigator.pop();
      MECLogger.log('$_string system pop');
    }
    return result;
  }

  static Future pushReplacementNamed<T>(BuildContext context, String routeName, {T arguments, bool useRootNavigator: false}) {
    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    MECLogger.log('$_string pushReplacementNamed $routeName');
    return navigatorState.pushReplacementNamed(routeName, arguments: arguments);

  }

  static void popUntil<T>(BuildContext context, String routeName, {bool useRootNavigator: false}) {
    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    MECLogger.log('$_string popUntil $routeName');
    navigatorState.popUntil((route) => route.settings.name == routeName);

  }

  static void popAndPushNamed<T>(BuildContext context, String routeName, {T arguments, bool useRootNavigator: false}) {
    var navigatorState = Navigator.of(context, rootNavigator: useRootNavigator);
    MECLogger.log('$_string popAndPushNamed $routeName');
    navigatorState.popAndPushNamed(routeName, arguments: arguments);

  }
}