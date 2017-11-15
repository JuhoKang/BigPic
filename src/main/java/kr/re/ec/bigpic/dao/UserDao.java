package kr.re.ec.bigpic.dao;

import java.util.List;

import kr.re.ec.bigpic.model.User;

public interface UserDao {

  User findById(int id);

  User findBySso(String ssoId);

  void saveUser(User user);

  void deleteUserById(int id);

  List<User> findAllUsers();

  void setUserAuth(String ssoId, String auth);

  void updateUser(User user);
}
