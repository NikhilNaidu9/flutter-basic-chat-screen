import 'package:flutter/material.dart';
import 'chart_message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();

  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    ChatMessage chatMessage = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, chatMessage);
    });
  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: new IconThemeData(color: Colors.orange),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  decoration:
                      new InputDecoration.collapsed(hintText: "Send a message"),
                  controller: _textEditingController,
                  onSubmitted: _handleSubmitted,
                ),
              ),
              new Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: () =>
                        _handleSubmitted(_textEditingController.text),
                  ))
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Flexible(
            child: new ListView.builder(
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
          padding: const EdgeInsets.all(8.0),
          reverse: true,
        )),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
