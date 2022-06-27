import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_app/generated/l10n.dart';

import 'package:login_app/screens/login.dart';
import 'package:login_app/screens/registration.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> localesMapper = Map.from({
      'en' : S.of(context).english,
      'ru': S.of(context).russian
    });
    final String selectedLocale = localesMapper[Intl.defaultLocale].toString();
    return Scaffold(
        drawer: Drawer(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(height: 40),
                ListTile(
                  title: DropdownButton(
                    underline: SizedBox(),
                    value: selectedLocale,
                    onChanged: (value) async {
                      switch(value)  {
                        case 'Английский':
                        case 'English':
                          S.load(Locale('en', ''));
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder:
                              (context) => Home()),
                                  (route) => false
                          );
                          // await locator<ServiceSecureStorage>().writeKey('user_locale', 'en');
                          // locator<NavigationService>().pushNamedAndRemoveUntil(routes.homeRoute);
                          break;
                        case 'Русский':
                        case 'Russian':
                          S.load(Locale('ru', ''));
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder:
                                  (context) => Home()),
                                  (route) => false
                          );
                          break;
                        default:
                          break;
                      }
                    },
                    items: <String>[S.of(context).english, S.of(context).russian]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text('  $value',
                              overflow: TextOverflow.ellipsis,
                          )
                      );
                    }).toList(),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(S.of(context).authorization),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                S.of(context).logOrRegister,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Login())
                      );
                    },
                    child: Text(S.of(context).enter)
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Registration())
                      );
                    },
                    child: Text(S.of(context).registration)
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        )
    );
  }
}