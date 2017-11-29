package kr.re.ec.bigpic.config;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class MySocketHandler extends TextWebSocketHandler {

  @Override
  protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

  }

}
