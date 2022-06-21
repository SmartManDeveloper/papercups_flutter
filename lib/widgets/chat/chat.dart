import 'package:flutter/material.dart';

import '../../models/models.dart';
import 'chatMessage.dart';

class ChatMessages extends StatelessWidget {
  final Props props;
  final List<PapercupsMessage>? messages;
  final bool sending;
  final ScrollController _controller;
  final String locale;
  final timeagoLocale;
  final String sendingText;
  final String sentText;
  final Color textColor;
  final void Function(PapercupsMessage)? onMessageBubbleTap;

  ChatMessages(
    this.props,
    this.messages,
    this._controller,
    this.sending,
    this.locale,
    this.timeagoLocale,
    this.sendingText,
    this.sentText,
    this.textColor,
    this.onMessageBubbleTap, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, layout) {
      return Container(
        alignment: Alignment.topCenter,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: ListView.builder(
            controller: _controller,
            physics: props.scrollEnabled ? ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: messages!.length,
            itemBuilder: (context, index) {
              return ChatMessage(
                msgs: messages,
                index: index,
                props: props,
                sending: sending,
                locale: locale,
                timeagoLocale: timeagoLocale,
                maxWidth: layout.maxWidth * 0.65,
                sendingText: sendingText,
                sentText: sentText,
                textColor: textColor,
              );
            },
          ),
        ),
      );
    });
  }
}
