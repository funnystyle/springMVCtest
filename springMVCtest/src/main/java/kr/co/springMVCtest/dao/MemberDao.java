package kr.co.springMVCtest.dao;

import java.util.List;

import kr.co.springMVCtest.domain.Member;

public interface MemberDao {
	void add(Member member);
	void update(Member member);
	Member get(String id);
	List<Member> list(int page);
	void delete(String id);
}
