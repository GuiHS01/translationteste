import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'util/app_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //Requisição da tradução para o idioma do dispositivo.
      onGenerateTitle: (context) =>
          AppLocalizations.of(context).translate('app_titulo'),
      home: MyHomePage(),
      supportedLocales: [
        //Informo qual idioma estou dando suporte
        Locale('en', 'US'),
        Locale('pt', 'BR'),
        Locale('es', 'ES'),
        Locale('es', 'AR'),
        Locale('es', 'MX'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Requisição da tradução para o idioma do dispositivo.
        title: Text(AppLocalizations.of(context).translate('main_titulo')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Requisição da tradução para o idioma do dispositivo.
            Text(AppLocalizations.of(context).translate('contador')),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        //Requisição da tradução para o idioma do dispositivo.
        tooltip: AppLocalizations.of(context).translate('btncount_placeholder'),
        child: Icon(Icons.add),
      ),
    );
  }
}
