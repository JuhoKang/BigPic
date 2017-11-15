package kr.re.ec.bigpic.dao;

import java.util.List;

import kr.re.ec.bigpic.model.User;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {

  @Override
  public User findById(int id) {
    return getByKey(id);
  }

  @Override
  public User findBySso(String ssoId) {
    Criteria criteria =
        createEntityCriteria().add(Restrictions.eq("ssoId", ssoId));
    return (User) criteria.uniqueResult();
  }

  @Override
  public void saveUser(User user) {
    persist(user);
  }

  @Override
  public void deleteUserById(int id) {
    Query query =
        getSession().createSQLQuery("delete from app_user_user_profile where user_id = :id");
    query.setString("id", "" + id);
    query.executeUpdate();
    query = getSession().createSQLQuery("delete from app_user where id = :id");
    query.setString("id", "" + id);
    query.executeUpdate();
  }

  @Override
  public void setUserAuth(String ssoId, String auth) {
    Query query =
        getSession()
            .createSQLQuery(
                "INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id) SELECT user.id, profile.id FROM app_user user, user_profile profile where user.sso_id=:ssoId and profile.type=:auth");
    query.setString("ssoId", ssoId);
    query.setString("auth", auth);
    query.executeUpdate();
  }

  @SuppressWarnings("unchecked")
  @Override
  public List<User> findAllUsers() {
    Criteria criteria = createEntityCriteria();
    return (List<User>) criteria.list();

  }

  @Override
  public void updateUser(User user) {
    // TODO Auto-generated method stub
  }


}
