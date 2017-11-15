package kr.re.ec.bigpic.dao;

import java.util.List;

import kr.re.ec.bigpic.model.Post;

import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("postDao")
/**
 * Posts are basicly desc order
 * @author MNDCERT
 *
 */
public class PostDaoImpl extends AbstractDao<Integer, Post> implements PostDao {

  @Override
  public void savePost(Post post) {
    persist(post);
  }

  @Override
  public void deletePostById(int id) {
    Post target = new Post();
    target.setId(id);
    delete(target);
  }

  @Override
  public void updatePost(Post post) {
    update(post);
  }

  @SuppressWarnings("unchecked")
  @Override
  public List<Post> getAllPosts() {
    return createEntityCriteria().addOrder(Order.desc("createTime")).list();
  }

  @Override
  public int countAllPosts() {
    return createEntityCriteria().setProjection(Projections.rowCount()).uniqueResult().hashCode();
  }

  /**
   * This method is half open first <= x < last
   */
  @SuppressWarnings("unchecked")
  @Override
  public List<Post> getNPostsFromM(int m, int n) {
    return createEntityCriteria().addOrder(Order.desc("createTime")).setFirstResult(m)
        .setMaxResults(n).list();
  }

  @Override
  public Post getPostById(int id) {
    return (Post) createEntityCriteria().add(Restrictions.eq("id", id)).uniqueResult();
  }

}
