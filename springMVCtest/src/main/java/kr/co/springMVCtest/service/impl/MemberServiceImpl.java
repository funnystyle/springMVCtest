package kr.co.springMVCtest.service.impl;

import java.util.List;

import kr.co.springMVCtest.dao.MemberDao;
import kr.co.springMVCtest.domain.Member;
import kr.co.springMVCtest.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	@Autowired MemberDao dao;

	public void add(Member member) {
		//member.setCreated(new Date());
		//member.setCreated(new Date());
		dao.add(member);
	}

	public void delete(int seq) {
		dao.delete(seq);
	}

	public Member get(int seq) {
		return dao.get(seq);
	}

	public List<Member> list(int page) {
		return dao.list(page);
	}

	public void update(Member member) {
		dao.update(member);
	}
	
}
