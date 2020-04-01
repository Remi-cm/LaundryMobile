import 'package:flutter/material.dart';
import 'package:laundrymobile/providers/profile.dart';
import 'package:provider/provider.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProfileProvider>(
      builder: (_) => UserProfileProvider(0, "", "", ""),
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: navigatorKey,
        onGenerateRoute: Routes.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}


