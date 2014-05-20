package kr.co.springMVCtest.dao.impl;

import java.util.List;

import kr.co.springMVCtest.dao.MemberDao;
import kr.co.springMVCtest.domain.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@SuppressWarnings("deprecation")
@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired SqlMapClientTemplate sqlMapClientTemplate;
	
	public void add(Member member) {
		//member.setId((int)System.currentTimeMillis());
		sqlMapClientTemplate.insert("Member.add", member);
	}

	public void delete(int seq) {
		sqlMapClientTemplate.delete("Member.delete", seq);
	}

	public Member get(int seq) {
		return (Member) sqlMapClientTemplate.queryForObject("Member.get", seq);
	}
	
	public void update(Member member) {
		sqlMapClientTemplate.update("Member.update", member);	
	}

	@SuppressWarnings("unchecked")
	public List<Member> list(int page) {
		return sqlMapClientTemplate.queryForList("Member.list", (page - 1) * 10, 10);
	}
}
