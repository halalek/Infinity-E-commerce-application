



import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:structurepublic/src/pages/vereible.dart';

import '../../main.dart';



class MyAppcon extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppcon> {
  bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  String _currentLocaleId = '';
  int resultListened = 0;
  List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();


  @override
  void initState() {
    super.initState();
    initSpeechState();
  }

  Future<void> initSpeechState() async {
    var hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        debugLogging: true,
      //  finalTimeout: Duration(milliseconds: 0)
    );
    if (hasSpeech) {
      _localeNames = await speech.locales();

      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale?.localeId ?? '';
    }

    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Container(color:Theme.of(context).scaffoldBackgroundColor,

    child:
        Column(children: [

          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: <Widget>[
             Text("",style: TextStyle(fontSize: 100),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    DropdownButton(
                      onChanged: (selectedVal) => _switchLang(selectedVal),
                      value: _currentLocaleId,
                      items: _localeNames
                          .map(
                            (localeName) => DropdownMenuItem(
                          value: localeName.localeId,
                          child: Text(localeName.name,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 20),),
                        ),
                      )
                          .toList(),
                    ),
                  ],
                )
              ],
            ),
          ),


                Column(
                    children: <Widget>[
                      Text("",style: TextStyle(fontSize: 50),),
                     Center(
                          child: Text(
                            lastWords,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20,color: Theme.of(context).primaryColor),
                          ),
                        ),
                      Text("",style: TextStyle(fontSize: 50),),
                     // Text("",style: TextStyle(fontSize: 100),),
                        IconButton(
                                icon: Icon(Icons.mic,color: Theme.of(context).primaryColorDark,size: 30,),
                                onPressed: !_hasSpeech || speech.isListening
                                    ? null
                                    : startListening,
                              ),


              ],
            ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: Theme.of(context).primaryColorDark,
            child: Center(
              child: speech.isListening
                  ? Text(
                "I'm listening...",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
                  : Text(
                'Not listening',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Text("",style: TextStyle(fontSize: 50),),
          GestureDetector(child: Container(
            width: 100,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child:
            Center(child: Text( language1=="en" ? "Add a Note" : "  إضافة الملاحظة ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),),
            ),
          ),
            onTap: (){
            var parts=lastWords.split('-');
            var perfix=parts[0].trim();
            Navigator.pop(context, perfix);
           //   Scaffold.of(context).showSnackBar(_snackBar1);
            },
          ),
        ]),
      ),
      ));
  }

  void startListening() {
    lastWords = '';
    lastError = '';
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 30),
        pauseFor: Duration(seconds: 5),
        partialResults: true,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation
    );
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    ++resultListened;
    print('Result listener $resultListened');
    setState(() {
      lastWords = '${result.recognizedWords} - ${result.finalResult}';
    });
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    // print("Received error status: $error, listening: ${speech.isListening}");
    setState(() {
      lastError = '${error.errorMsg} - ${error.permanent}';
    });
  }

  void statusListener(String status) {
    // print(
    // 'Received listener status: $status, listening: ${speech.isListening}');
    setState(() {
      lastStatus = '$status';
    });
  }

  void _switchLang(selectedVal) {
    setState(() {
      _currentLocaleId = selectedVal;
    });
    print(selectedVal);
  }
}