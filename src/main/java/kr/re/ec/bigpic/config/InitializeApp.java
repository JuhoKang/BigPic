package kr.re.ec.bigpic.config;

import javax.annotation.PostConstruct;

import kr.re.ec.bigpic.model.UserProfile;
import kr.re.ec.bigpic.model.UserProfileType;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class InitializeApp {

  @Autowired
  private SessionFactory sessionFactory;

  @PostConstruct
  public void initialize() {
    System.out.println("initialize db");
    if (createEntityCriteria(UserProfile.class).setMaxResults(1).list().isEmpty()) {
      Session session = getSession();
      Transaction tx = session.beginTransaction();
      for (UserProfileType type : UserProfileType.values()) {
        UserProfile profile = new UserProfile();
        profile.setType(type.getUserProfileType());
        session.persist(profile);
      }
      session.flush();
      session.clear();
      tx.commit();
    }
    System.out.println("end of initialization");
  }

  private Session getSession() {
    Session session;

    try {
        session = sessionFactory.getCurrentSession();
    } catch (HibernateException e) {
        session = sessionFactory.openSession();
    }
    return session;
  }

  private Criteria createEntityCriteria(@SuppressWarnings("rawtypes") Class arg) {
    return getSession().createCriteria(arg);
  }

}
