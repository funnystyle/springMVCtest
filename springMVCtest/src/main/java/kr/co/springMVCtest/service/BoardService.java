package kr.co.springMVCtest.service;

import java.util.List;

import kr.co.springMVCtest.domain.Board;

public interface BoardService {
	void add(Board board);
	void update(Board board);
	Board get(int seq);
	List<Board> list(int page);
	void delete(int seq);
	void incrementCount(int seq);
}
