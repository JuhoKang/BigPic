package kr.re.ec.bigpic.service;

import java.util.List;

import kr.re.ec.bigpic.dao.PostDao;
import kr.re.ec.bigpic.model.Post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("postService")
@Transactional
public class PostServiceImpl implements PostService {

  private final int postPerPage = 10;

  @Autowired
  private PostDao dao;

  @Override
  public List<Post> getPostsForPageN(int n) {
    return dao.getNPostsFromM((n-1)*postPerPage, postPerPage);
  }

  // 1page / 10posts
  @Override
  public int getTotalPageLength() {
    return (dao.countAllPosts() / postPerPage) + 1;
  }

  @Override
  public void savePost(Post post) {
    dao.savePost(post);
  }

  @Override
  public void deletePostById(int id) {
    dao.deletePostById(id);
  }

  @Override
  public void updatePost(Post post) {
    dao.updatePost(post);
  }

  @Override
  public List<Post> getAllPosts() {
    return dao.getAllPosts();
  }

  @Override
  public Post getPostById(int id) {
    return dao.getPostById(id);
  }

}
