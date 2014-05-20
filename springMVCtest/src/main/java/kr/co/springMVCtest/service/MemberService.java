package kr.co.springMVCtest.service;

import java.util.List;

import kr.co.springMVCtest.domain.Member;

public interface MemberService {
	void add(Member member);
	void update(Member member);
	Member get(int seq);
	List<Member> list(int page);
	void delete(int seq);
}
