import 'package:appandup_take_home/provider/book_list.dart';
import 'package:appandup_take_home/provider/user_provider.dart';
import 'package:appandup_take_home/ui/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/routes.dart' as router;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NetworkManager()),
        ChangeNotifierProvider(create: (context) => GoogleSignInService()),
        // FutureProvider(
        //     create: (context) => NetworkManager().getBook(),
        //     initialData: BooksList(
        //       kind: 'wait',
        //       items: [],
        //       totalItems: 10,
        //     )),
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthenticationWrapper(),
      onGenerateRoute: router.generateRoute,
    );
  }
}
