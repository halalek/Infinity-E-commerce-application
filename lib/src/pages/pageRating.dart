import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class MyAppo extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppo> {
   var _ratingController;
   double _rating;
  double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData _selectedIcon;

  _MyAppState();

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Flutter Rating Bar'),
            actions: [

            ],
          ),
          body: Directionality(
            textDirection: _isRTLMode ? TextDirection.rtl : TextDirection.ltr,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                  ),
                  _heading('من فضلك قييم الطلب '),
                RatingBar(
                  initialRating: _initialRating,
                  direction: _isVertical ? Axis.vertical : Axis.horizontal,
                  itemCount: 5,
                  allowHalfRating: true,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.redAccent,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                        );
                      case 3:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.lightGreen,
                        );
                      case 4:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.green,
                        );
                      default:
                        return Container();
                    }
                  },
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },),
                  SizedBox(height: 20.0),
                  Text(
                    'Rating: $_rating',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [

                 InkWell(child:
                 Container(
                   height: 50,
                   width: 50,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       gradient: LinearGradient(
                           colors: [
                            // Colors.green,
                             Colors.black38,
                             Colors.redAccent
                           ]
                       )
                   ),
                   child: Center(
                     child: Text("إرسال التقييم ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                   ),
                 ),
                   onTap: ()  {
                     setState(() {
                       //  _con. getProductsSearch();
                     });



                   },
                 ),

                 InkWell(child:
                 Container(
                   height: 50,
                   width: 50,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       gradient: LinearGradient(
                           colors: [
                             Colors.black38,
                             Colors.redAccent
                           ]
                       )
                   ),
                   child: Center(
                     child: Text("عودة", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                   ),
                 ),
                   onTap: ()  {
                     setState(() {
                       //  _con. getProductsSearch();
                     });



                   },
                 ),
               ],),
                    ],
                  ),

              ),
            ),
          ),
        ),
      );
  }





  Widget _image(String asset) {
    return Image.asset(
      asset,
      height: 30.0,
      width: 30.0,
      color: Colors.amber,
    );
  }

  Widget _heading(String text) => Column(
    children: [
      Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 24.0,
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
    ],
  );
}

