import 'package:final_project/widget/author_detail.dart';
import 'package:flutter/material.dart';

class QuoteDetailScreen extends StatelessWidget {
  final Map<String, String> quoteData;

  const QuoteDetailScreen(this.quoteData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Quote Details", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: AuthorDetail(quoteData["author"] ?? "Unknown")),
            const SizedBox(height: 10),
            const Text(
              "Quotes",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                              quoteData["BgImgpath"] ?? "assets/default.jpg"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            // ignore: deprecated_member_use
                            Colors.black.withOpacity(0.5),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            '“ ${quoteData["quote"] ?? "No quote available"} ”',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    if (quoteData["note"] != null &&
                        quoteData["note"]!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          quoteData["note"]!,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
