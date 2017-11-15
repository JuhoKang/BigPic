package kr.re.ec.bigpic.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "app_" + "user")
public class User {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;

  @NotBlank
  @Size(max = 30)
  @Column(name = "sso_id", nullable = false, unique = true)
  private String ssoId;

  @NotBlank
  @Size(max = 100)
  @Column(name = "password", nullable = false)
  private String password;

  @NotBlank
  @Size(max = 15)
  @Column(name = "name", nullable = false)
  private String name;

  @Column(name = "state", nullable = false)
  private String state = State.ACTIVE.getState();

  @ManyToMany(fetch = FetchType.EAGER)
  @JoinTable(name = "APP_USER_USER_PROFILE", joinColumns = {@JoinColumn(name = "USER_ID")},
      inverseJoinColumns = {@JoinColumn(name = "USER_PROFILE_ID")})
  private Set<UserProfile> userProfiles = new HashSet<UserProfile>();

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getSsoId() {
    return ssoId;
  }

  public void setSsoId(String ssoId) {
    this.ssoId = ssoId;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }

  public Set<UserProfile> getUserProfiles() {
    return userProfiles;
  }

  public void setUserProfiles(Set<UserProfile> userProfiles) {
    this.userProfiles = userProfiles;
  }

  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder();
    builder.append("User [id=");
    builder.append(id);
    builder.append(", ssoId=");
    builder.append(ssoId);
    builder.append(", password=");
    builder.append(password);
    builder.append(", name=");
    builder.append(name);
    builder.append(", state=");
    builder.append(state);
    builder.append(", userProfiles=");
    builder.append(userProfiles);
    builder.append("]");
    return builder.toString();
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + id;
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    result = prime * result + ((password == null) ? 0 : password.hashCode());
    result = prime * result + ((ssoId == null) ? 0 : ssoId.hashCode());
    result = prime * result + ((state == null) ? 0 : state.hashCode());
    result = prime * result + ((userProfiles == null) ? 0 : userProfiles.hashCode());
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
    User other = (User) obj;
    if (id != other.id)
      return false;
    if (name == null) {
      if (other.name != null)
        return false;
    } else if (!name.equals(other.name))
      return false;
    if (password == null) {
      if (other.password != null)
        return false;
    } else if (!password.equals(other.password))
      return false;
    if (ssoId == null) {
      if (other.ssoId != null)
        return false;
    } else if (!ssoId.equals(other.ssoId))
      return false;
    if (state == null) {
      if (other.state != null)
        return false;
    } else if (!state.equals(other.state))
      return false;
    if (userProfiles == null) {
      if (other.userProfiles != null)
        return false;
    } else if (!userProfiles.equals(other.userProfiles))
      return false;
    return true;
  }

}
