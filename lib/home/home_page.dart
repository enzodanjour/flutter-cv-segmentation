import 'package:fairfax_carros/home/components/botton_sheet.dart';
import 'package:fairfax_carros/home/components/history_cars_widget.dart';
import 'package:fairfax_carros/home/components/my_insurances_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/card_initial_screen_widget.dart';
import 'components/label_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<int> indexSelected = ValueNotifier<int>(0);
  ValueNotifier<bool> isOk = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
          0xffF5F5F5,
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        elevation: 0,
        centerTitle: true,
        title: Image.network(
          'https://central.fairfax.com.br/source/img/ff-logo-header.png',
          width: 50,
          height: 50,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/thalia.jpg',
              ),
              radius: 20,
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xffF5F5F5),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {},
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: 1,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.car_detailed),
            label: 'Seguros',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.dashboard_customize_rounded),
            icon: Icon(Icons.dashboard_customize_outlined),
            label: 'Saved',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.help_outline),
            icon: Icon(Icons.help_outline),
            label: 'Saved',
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              'Bem vindo!',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CardInitialScreen(),
          const SizedBox(
            height: 20,
          ),
          LabelBarWidget(
            label: 'Meus seguros',
            onTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          MyInsurancesWidget(
            onTap: () {
              BottonSheet().show(
                context,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/personal_profile',
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          LabelBarWidget(
            label: 'Histórico',
            onTap: () {},
          ),
          HistoryCarsWidget(
            car: 'Benz CL250',
            data: 'Faria lima | 02 Jan,2022 | 6:44AM',
          )
        ],
      ),
    );
  }
}
