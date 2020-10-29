import 'package:flutter/material.dart';

class StarFav extends StatefulWidget {
  final int _num;
  final bool _like;

  StarFav(this._num, this._like);

  @override
  createState() => new StarState(_num, _like);
}

class StarState extends State<StarFav> {
  int num;
  bool like;

  StarState(this.num, this.like);

  void pressButton() {
    setState(() {
      like = !like;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(children: [
    new Text('$like', textAlign: TextAlign.center),
    new IconButton(
    icon: new Icon(like ? Icons.star : Icons.star_border, size: 30.0, color: Colors.teal),
    onPressed: pressButton
    )
    ]);
  }
}

class Star extends StatelessWidget {
  int _num;
  bool _like = false;


  Star(this._num);

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 65.0,
        alignment: Alignment.center,
        child: new StarFav(_num, _like)
    );
  }
}

class SliderWidget extends StatefulWidget {
  SliderWidget({Key key}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SliderWidgetState extends State<SliderWidget> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      divisions: 5,
      label: _currentSliderValue.round().toString(),
      activeColor: Colors.teal,
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

class TextFormWidget extends StatefulWidget {
  TextFormWidget({Key key}) : super(key: key);

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _TextFormWidgetState extends State<TextFormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your text',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return value;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: new Column(
              children: [
                new ElevatedButton(
                  style: new ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),),
                  onPressed: () {
    // Validate will return true if the form is valid, or false if
    // the form is invalid.
    if (_formKey.currentState.validate()) {

    }
    },

              child: Text('Submit'),
            ),
            ]
          ),
            )
            ],
      ),
    );
  }
}


void main() =>  runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(),
            body: new Column(
              children: [
                new Star(10),
                new TextFormWidget(),
                new SliderWidget(),
            ]
        )
    )
));