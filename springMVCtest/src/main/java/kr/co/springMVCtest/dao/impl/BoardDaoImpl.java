package kr.co.springMVCtest.dao.impl;

import java.util.List;

import kr.co.springMVCtest.dao.BoardDao;
import kr.co.springMVCtest.domain.Board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@SuppressWarnings("deprecation")
@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired SqlMapClientTemplate sqlMapClientTemplate;
	
	public void add(Board board) {
		//member.setId((int)System.currentTimeMillis());
		sqlMapClientTemplate.insert("Board.add", board);
	}

	public void delete(int seq) {
		sqlMapClientTemplate.delete("Board.delete", seq);
	}

	public Board get(int seq) {
		return (Board) sqlMapClientTemplate.queryForObject("Board.get", seq);
	}
	
	public void update(Board board) {
		sqlMapClientTemplate.update("Board.update", board);	
	}

	@SuppressWarnings("unchecked")
	public List<Board> list(int page) {
		return sqlMapClientTemplate.queryForList("Board.list", (page - 1) * 10, 10);
	}

	@Override
	public void incrementCount(int seq) {
		sqlMapClientTemplate.update("Board.incrementCount", seq);	
	}
}
