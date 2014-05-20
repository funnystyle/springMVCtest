package kr.co.springMVCtest.service.impl;

import java.util.List;

import kr.co.springMVCtest.dao.BoardDao;
import kr.co.springMVCtest.domain.Board;
import kr.co.springMVCtest.service.BoardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;

	public void add(Board board) {
		// member.setCreated(new Date());
		// member.setCreated(new Date());
		dao.add(board);
	}

	public void delete(int seq) {
		dao.delete(seq);
	}

	public Board get(int seq) {
		return dao.get(seq);
	}

	public List<Board> list(int page) {
		return dao.list(page);
	}

	public void update(Board board) {
		dao.update(board);
	}

	@Override
	public void incrementCount(int seq) {
		dao.incrementCount(seq);
	}

}
