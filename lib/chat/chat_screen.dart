import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String productName;

  const ChatPage({super.key, required this.productName});

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessage> messages = []; // Daftar pesan

  TextEditingController textController =
      TextEditingController(); // Controller untuk input teks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat With Admin'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: messages[index].isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: messages[index].isMe ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        messages[index].text,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      setState(() {
                        messages.add(ChatMessage(textController.text,
                            true)); // Menambahkan pesan pengguna ke daftar
                        textController.clear(); // Menghapus teks dari input
                        // Simulasi pesan balasan dari "sisi lain"
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            messages.add(ChatMessage(
                                'Maaf Kak untuk kemeja ukuran L stoknya habis',
                                false));
                          });
                        });
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isMe; // Menandai apakah pesan ini dari pengguna saat ini

  ChatMessage(this.text, this.isMe);
}
