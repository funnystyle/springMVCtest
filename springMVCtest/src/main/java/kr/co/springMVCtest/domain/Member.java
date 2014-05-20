package kr.co.springMVCtest.domain;

import java.util.Date;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

public class Member {

	int seq;

	@NotNull
	@Size(min = 1, message = "입력하세요.")
	String id;

	@NotNull
	@Size(min = 1, message = "입력하세요.")
	String password;

	@NotNull
	@Size(min = 1, message = "입력하세요.")
	String name;

	@NotNull
	Date birthday;

	@NotNull
	@Email
	String email;

	@Digits(integer=4, fraction=0)
	String mobilephone_1;
	
	@Digits(integer=4, fraction=0)
	String mobilephone_2;
	
	@Digits(integer=4, fraction=0)
	String mobilephone_3;

	@NotNull
	@Length(min=1, max=1)
	String sex;

	Date created;

	Date modified;
	
	boolean enabled; 

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobilephone_1() {
		return mobilephone_1;
	}

	public void setMobilephone_1(String mobilephone_1) {
		this.mobilephone_1 = mobilephone_1;
	}

	public String getMobilephone_2() {
		return mobilephone_2;
	}

	public void setMobilephone_2(String mobilephone_2) {
		this.mobilephone_2 = mobilephone_2;
	}

	public String getMobilephone_3() {
		return mobilephone_3;
	}

	public void setMobilephone_3(String mobilephone_3) {
		this.mobilephone_3 = mobilephone_3;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getModified() {
		return modified;
	}

	public void setModified(Date modified) {
		this.modified = modified;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

}
