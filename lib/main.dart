// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_best_quotes/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class BestQuotes {
  String title;
  String author;
  BestQuotes({required this.title, required this.author});
}

class _QuotesState extends State<Quotes> {
  List AllQUotes = [
    BestQuotes(
        title: "الحب الحقيقي ليس اول حب وإنما هو الحب الذي يدوم",
        author: "Elagamy"),
    BestQuotes(
        title: "لا يهم كم أنت بطيئ طالما أنك لن تتوقف", author: "Elagamy"),
    BestQuotes(
        title: "لا يوجد طريق مختصر إلى مكان يستحق الذهاب إليه",
        author: "Elagamy"),
    BestQuotes(
        title: "كن التغير الذي تريد أن تراه في العالم", author: "Elagamy"),
    BestQuotes(
        title: "دائما خذ في عين الإعتبار أن قرار النجاح هو أهم من أي شيئ آخر",
        author: "Elagamy"),
    BestQuotes(
        title:
            "الخطر الأعظمم على معظمنا هو ليس أن يكون هدفنا عال جداً, و أن نخفق في تحقيقه, بل أن يكون سهلاً جداً و نحققه",
        author: "Elagamy"),
  ];

  delete(BestQuotes item) {
    setState(() {
      AllQUotes.remove(item);
    });
  }

  addQuote() {
    setState(() {
      AllQUotes.add(BestQuotes(title: Quote.text, author: Author.text));
    });
  }

  final Quote = TextEditingController();
  final Author = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: Quote,
                        maxLength: 30,
                        decoration: InputDecoration(
                          hintText: "add Quote",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: Author,
                        maxLength: 15,
                        decoration: InputDecoration(
                          hintText: "Quote Author",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextButton(
                          onPressed: () {
                            addQuote();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                );
              },
              isScrollControlled: true);
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 57, 121),
        title: Text(
          "Best Quotes",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: AllQUotes.map((item) => Cardwidget(
                delete: delete,
                item: item,
              )).toList(),
        ),
      ),
    );
  }
}
