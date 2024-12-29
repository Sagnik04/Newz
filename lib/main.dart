import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:newz_2/features/business/ui/business_ui.dart';
import 'package:newz_2/features/entertainment/ui/entertainment_ui.dart';
import 'package:newz_2/features/technology/ui/ui.dart';

import 'features/home/ui/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int myIndex= 0;
  final screens = [HomePage(),BusinessPage(),EntertainmentPage(),TechPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            myIndex  = index;
          });
        },
        currentIndex: myIndex,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: Colors.black,),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business,color: Colors.black,),label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.movie_outlined,color: Colors.black,),label: 'Entertainment'),
          BottomNavigationBarItem(icon: Icon(Icons.phone_android,color: Colors.black,),label: 'Technology'),

        ],
      ),
      body: IndexedStack(
        index: myIndex,
        children: screens,
      ),

    );

  }
}


