import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final QueryDocumentSnapshot item;

  const DetailPage({super.key, required this.item});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {
  late Map<String, dynamic> itemData;
  final TextEditingController commentController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    itemData = widget.item.data() as Map<String, dynamic>;
    descriptionController.text = itemData['description'] ?? ''; // Initialize description
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    commentController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> markAsFound() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[850],
          title: const Text("Mark as Found", style: TextStyle(color: Colors.white)),
          content: TextField(
            controller: commentController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Leave a helpful comment...",
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.grey[800],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection("lost_items")
                    .doc(widget.item.id)
                    .update({
                  'status': 'found', // Update the status to 'found'
                  'found_comment': commentController.text,
                });
                setState(() {
                  itemData['status'] = 'found';
                  itemData['found_comment'] = commentController.text;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Item marked as found!")),
                );
              },
              child: const Text("Confirm", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Future<void> addComment() async {
    if (commentController.text.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection("lost_items")
          .doc(widget.item.id)
          .collection("comments")
          .add({
        'text': commentController.text,
        'timestamp': Timestamp.now(),
      });
      commentController.clear();
      setState(() {});
    }
  }

  Future<void> updateDescription() async {
    if (descriptionController.text.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection("lost_items")
          .doc(widget.item.id)
          .update({
        'description': descriptionController.text,
      });
      setState(() {
        itemData['description'] = descriptionController.text;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Description updated!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFound = itemData['status'] == 'found';
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text("Item Details"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.item.id,
              child: Card(
                color: Colors.grey[850],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemData['item_name'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: isFound ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Posted by: ${itemData['user_email']}",
                        style: TextStyle(color: Colors.grey[400], fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Description: ${itemData['description'] ?? 'No description provided'}",
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      if (isFound && itemData['found_comment'] != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Marked as Found: ${itemData['found_comment']}",
                            style: const TextStyle(color: Colors.amber, fontSize: 16),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (!isFound)
              Column(
                children: [
                  TextField(
                    controller: descriptionController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Add or update description...",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: updateDescription,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[700],
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Update Description",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            if (!isFound)
              Center(
                child: ElevatedButton(
                  onPressed: markAsFound,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[700],
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Mark as Found",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            else
              Center(
                child: Text(
                  "This item has been marked as found.",
                  style: TextStyle(
                    color: Colors.green[400],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("lost_items")
                    .doc(widget.item.id)
                    .collection("comments")
                    .orderBy("timestamp", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("No comments yet", style: TextStyle(color: Colors.white)),
                    );
                  }
                  return ListView(
                    children: snapshot.data!.docs.map((doc) {
                      return FadeTransition(
                        opacity: _fadeAnimation,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(
                              doc['text'],
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              "Posted at: ${(doc['timestamp'] as Timestamp).toDate()}",
                              style: TextStyle(color: Colors.grey[400], fontSize: 12),
                            ),
                            tileColor: Colors.grey[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: commentController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Write a comment...",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: addComment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[700],
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Icon(Icons.send, size: 24),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}