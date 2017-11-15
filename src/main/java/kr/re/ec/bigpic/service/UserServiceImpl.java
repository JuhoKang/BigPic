package kr.re.ec.bigpic.service;

import java.util.List;

import kr.re.ec.bigpic.dao.UserDao;
import kr.re.ec.bigpic.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

  @Autowired
  private UserDao dao;

  @Autowired
  private PasswordEncoder passwordEncoder;

  @Override
  public User findById(int id) {
    return dao.findById(id);
  }

  @Override
  public User findBySso(String ssoId) {
    return dao.findBySso(ssoId);
  }
  
  
  //encode password and save.
  @Override
  public void saveUser(User user) {
    User passwordChangedUser = user;
    passwordChangedUser.setPassword(passwordEncoder.encode(user.getPassword()));
    dao.saveUser(passwordChangedUser);
  }

  @Override
  public List<User> findAllUsers() {
    return dao.findAllUsers();
  }

  @Override
  public void setUserAuth(String ssoId, String auth) {
    dao.setUserAuth(ssoId, auth);
  }

  public boolean isSsoUnique(Integer id, String ssoId) {
    User user = findBySso(ssoId);
    return (user == null || ((id != null) && (user.getId() == id)));
  }

  @Override
  public void updateUser(User user) {
    dao.updateUser(user);
  }

  @Override
  public void changeUserPassword(User user) {
    User passwordChangedUser = user;
    passwordChangedUser.setPassword(passwordEncoder.encode(user.getPassword()));
    dao.updateUser(passwordChangedUser);
  }

  @Override
  public void deleteUserById(int id) {
    dao.deleteUserById(id);
  }

}
