package kr.re.ec.bigpic.service;

import java.util.List;

import kr.re.ec.bigpic.model.Post;

public interface PostService {

  public List<Post> getPostsForPageN(int n);

  public int getTotalPageLength();

  public void savePost(Post post);

  public void deletePostById(int id);

  public void updatePost(Post post);

  public List<Post> getAllPosts();
  
  public Post getPostById(int id);

}
