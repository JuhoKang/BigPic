package kr.re.ec.bigpic.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotBlank;
import org.joda.time.DateTime;

@Entity
@Table(name = "post")
public class Post {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;

  @NotNull
  @Size(max = 80)
  @Column(name = "title")
  private String title;

  @Lob
  @Column(name = "content")
  private String content;

  @NotBlank
  @Size(max = 30)
  @Column(name = "writer_sso_id")
  private String writerSsoId;

  @Column
  @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
  private DateTime createTime;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getWriterSsoId() {
    return writerSsoId;
  }

  public void setWriterSsoId(String writerSsoId) {
    this.writerSsoId = writerSsoId;
  }

  public DateTime getCreateTime() {
    return createTime;
  }

  public void setCreateTime(DateTime createTime) {
    this.createTime = createTime;
  }

  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder();
    builder.append("Post [id=");
    builder.append(id);
    builder.append(", title=");
    builder.append(title);
    builder.append(", content=");
    builder.append(content);
    builder.append(", writerSsoId=");
    builder.append(writerSsoId);
    builder.append(", createTime=");
    builder.append(createTime);
    builder.append("]");
    return builder.toString();
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((content == null) ? 0 : content.hashCode());
    result = prime * result + ((createTime == null) ? 0 : createTime.hashCode());
    result = prime * result + id;
    result = prime * result + ((title == null) ? 0 : title.hashCode());
    result = prime * result + ((writerSsoId == null) ? 0 : writerSsoId.hashCode());
    return result;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    Post other = (Post) obj;
    if (content == null) {
      if (other.content != null)
        return false;
    } else if (!content.equals(other.content))
      return false;
    if (createTime == null) {
      if (other.createTime != null)
        return false;
    } else if (!createTime.equals(other.createTime))
      return false;
    if (id != other.id)
      return false;
    if (title == null) {
      if (other.title != null)
        return false;
    } else if (!title.equals(other.title))
      return false;
    if (writerSsoId == null) {
      if (other.writerSsoId != null)
        return false;
    } else if (!writerSsoId.equals(other.writerSsoId))
      return false;
    return true;
  }

}
