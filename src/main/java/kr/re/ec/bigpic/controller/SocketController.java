package kr.re.ec.bigpic.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SocketController {

  @MessageMapping("/test")
  @SendTo("/so/testreturn")
  public String test (String s) {

    return "got something";
  }

}
