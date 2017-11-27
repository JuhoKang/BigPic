package kr.re.ec.bigpic.controller;

import java.util.List;

import kr.re.ec.bigpic.model.User;
import kr.re.ec.bigpic.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * This rest controller doesn't follow the best REST way because of convenience. Only one person
 * will use this API lol.
 * @author Juho Kang (rjduakcjs@gmail.com)
 */
@RestController
@RequestMapping("/rest")
public class DataRestController {

  @Autowired
  UserService userService;

  @RequestMapping(value = "/user", method = RequestMethod.GET)
  public List<User> getAllUsers() {
    return userService.findAllUsers();
  }

  @RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
  public User getUserById(@PathVariable("id") int id) {
    return userService.findById(id);
  }

  /*private String getUserName() {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    return auth.getName();
  }*/
}
