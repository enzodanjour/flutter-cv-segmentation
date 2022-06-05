import 'package:camera/camera.dart';
import 'package:fairfax_carros/home/home_page.dart';
import 'package:fairfax_carros/insurance/personal_profile_page.dart';
import 'package:fairfax_carros/picture/picture_page.dart';
import 'package:fairfax_carros/picture/picture_preview_page.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => const HomePage(),
        '/personal_profile': (BuildContext context) =>
            const PersonalProfilePage(),
        '/picture_page': (BuildContext context) =>
            PicturePage(controller: controller),
        '/picture_preview_page': (BuildContext context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
            return PicturePreviewPage(path: args);
        }
      },
    );
  }
}
