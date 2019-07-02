import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'flutter demo',
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(

        title: new Text("flutter demo"),

      ),

      body: _buildSuggesttions(),

    );
  }

  Widget _buildSuggesttions(){

    return new ListView.builder(

      padding:const EdgeInsets.all(16.0),

      itemBuilder: (context,i){

        if(i.isOdd) return new Divider();

        final index = i ~/ 2;

        print("i === $i");

        print("index === $index");

        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buidRow(_suggestions[index]);

      }


    );


  }

  Widget _buidRow(WordPair pair) {

    return new ListTile(

      title: new Text(

        pair.asPascalCase,

        style: _biggerFont,),


    );
  }

}