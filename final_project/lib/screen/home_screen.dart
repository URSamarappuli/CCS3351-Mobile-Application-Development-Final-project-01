import 'dart:math';
import 'package:final_project/screen/quote_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, List<Map<String, String>>> quotesByCategory = {
    "Motivational": [
      {
        "quote":
            "Success is not final, failure is not fatal, It is the courage to continue that counts.",
        "author": "Winston Churchill",
        "note":
            "Success is not final; failure is not fatal: It is the courage to continue that counts.",
        "BgImgpath": "assets/images/bgimages/Motivation.jpg",
      },
      {
        "quote": "Hard work beats talent.",
        "author": "Kevin Durant",
        "note": "",
        "BgImgpath": "assets/images/bgimages/Motivation.jpg",
      },
    ],
    "Finance": [
      {
        "quote": "The best investment is in yourself.",
        "author": "Warren Buffett",
        "note": "",
        "BgImgpath": "assets/images/bgimages/Finance.jpg",
      },
      {
        "quote": "Rich people invest first, then spend.",
        "author": "Robert Kiyosaki",
        "note": "",
        "BgImgpath": "assets/images/bgimages/Finance.jpg",
      },
    ],
    "Romance": [
      {
        "quote":
            "When one is in love, one always begins by deceiving one's self, and one always ends by deceiving others. That is what the world calls a romance",
        "author": "Oscar Wilde",
        "note":
            "When one is in love, one always begins by deceiving one's self, and one always ends by deceiving others. That is what the world calls a romance",
        "BgImgpath": "assets/images/bgimages/Romance.jpg",
      },
      {
        "quote":
            "Gifts are temporary and often forgotten; love is forever and always remembered.",
        "author": "Ken Poirot",
        "note":
            "Gifts are temporary and often forgotten; love is forever and always remembered.",
        "BgImgpath": "assets/images/bgimages/Romance.jpg",
      },
    ],
    "Happiness": [
      {
        "quote":
            "Happiness is the secret to all beauty. There is no beauty without happiness.",
        "author": "Christian Dior",
        "note":
            "Happiness is the secret to all beauty. There is no beauty without happiness.",
        "BgImgpath": "assets/images/bgimages/Happiness.jpg",
      },
      {
        "quote": "Happiness depends upon ourselves.",
        "author": "Aristotle",
        "note": "",
        "BgImgpath": "assets/images/bgimages/Happiness.jpg",
      },
    ],
  };

  String selectedCategory = "Motivational";
  Map<String, String> currentQuote = {};

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  void _getRandomQuote() {
    var quotes = quotesByCategory[selectedCategory]!;
    setState(() {
      currentQuote = quotes[Random().nextInt(quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quote Generator",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 320,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonFormField<String>(
                        value: selectedCategory,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Colors.blueGrey)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            selectedCategory = newValue!;
                            _getRandomQuote();
                          });
                        },
                        items: quotesByCategory.keys.map((category) {
                          return DropdownMenuItem(
                              value: category, child: Text(category));
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                QuoteDetailScreen(currentQuote)),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 560,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: AssetImage(currentQuote["BgImgpath"]!),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            // ignore: deprecated_member_use
                            Colors.black.withOpacity(0.5),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('“ ${currentQuote["quote"]!} ”',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.cinzel().fontFamily,
                                ),
                                textAlign: TextAlign.center),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "- ${currentQuote["author"]!} - ",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _getRandomQuote,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                          ),
                          child: const Text("New Quote",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
