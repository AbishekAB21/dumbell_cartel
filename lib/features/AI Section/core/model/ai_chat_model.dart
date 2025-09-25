
// A model for the Ai Chat Section

enum Sender{
  user,
  ai
}

class AiChatModel {

  final String text;
  final Sender sender;

  AiChatModel({required this.text, required this.sender});
}