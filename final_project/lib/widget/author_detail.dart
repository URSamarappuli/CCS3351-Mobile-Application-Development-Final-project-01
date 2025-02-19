import 'package:flutter/material.dart';

class AuthorDetail extends StatelessWidget {
  final String author;

  const AuthorDetail(this.author, {super.key});

  static const Map<String, Map<String, String>> authorDetails = {
    "Winston Churchill": {
      "bio": "Sir Winston Churchill was a British statesman and writer.",
      "image": "assets/images/authors/Winston_Churchill.jpg",
      "details":
          "Sir Winston Leonard Spencer Churchill (1874-1965) was the Prime Minister of the United Kingdom during World War II and again from 1951 to 1955."
    },
    "Oscar Wilde": {
      "bio":
          "Oscar Wilde was an Irish poet and playwright known for his wit and works like 'The Picture of Dorian Gray'.",
      "image": "assets/images/authors/Oscar_Wilde.jpg",
      "details":
          "Oscar Fingal O'Flahertie Wills Wilde (1854-1900) was a leading figure in the Aesthetic Movement in England."
    },
    "Ken Poirot": {
      "bio": "Ken Poirot is an author and financial expert.",
      "image": "assets/images/authors/Ken_Poirot.png",
      "details":
          "Ken Poirot has had a career in financial services working with major companies like American Express and JP Morgan Chase."
    },
    "Kevin Durant": {
      "bio":
          "Kevin Durant is a professional basketball player for the Phoenix Suns.",
      "image": "assets/images/authors/Kevin_Durant.png",
      "details":
          "Born in 1988, Kevin Durant is a two-time NBA champion and multiple award-winning basketball player."
    },
    "Warren Buffett": {
      "bio": "Warren Buffett is an American investor and philanthropist.",
      "image": "assets/images/authors/Warren_Buffett.jpg",
      "details":
          "Warren Edward Buffett, born in 1930, is the chairman and CEO of Berkshire Hathaway."
    },
    "Robert Kiyosaki": {
      "bio": "Robert Kiyosaki is an author known for 'Rich Dad Poor Dad'.",
      "image": "assets/images/authors/Robert_Kiyosaki.jpg",
      "details":
          "Robert Kiyosaki focuses on financial education and is known for his best-selling personal finance book series."
    },
    "Christian Dior": {
      "bio":
          "Christian Dior was a French fashion designer and founder of the Dior brand.",
      "image": "assets/images/authors/Christian_Dior.jpg",
      "details":
          "Christian Dior's 'New Look' revolutionized women's fashion after World War II."
    },
    "Aristotle": {
      "bio": "Aristotle was an Ancient Greek philosopher and polymath.",
      "image": "assets/images/authors/Aristotle.jpg",
      "details":
          "Aristotle's works span various disciplines, including philosophy, science, and politics."
    },
  };

  @override
  Widget build(BuildContext context) {
    final details = authorDetails[author];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              author,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage(details?["image"] ?? "assets/images/default.jpg"),
            ),
            const SizedBox(height: 20),
            Text(
              details?["bio"] ?? "Biography not available.",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              details?["details"] ?? "Additional details are not available.",
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
