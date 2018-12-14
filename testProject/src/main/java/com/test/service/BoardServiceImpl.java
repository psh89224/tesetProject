package com.test.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.test.domain.BoardVO;
import com.test.domain.Criteria;
import com.test.persistence.BoardDAO;

@Repository
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO dao;
	
	// create
	@Override
	public void create(BoardVO vo) throws Exception {
		dao.create(vo);
	}
	
	// read
	@Override
	public BoardVO read(int bno) throws Exception {
		return dao.read(bno);
	}
	
	// update
	@Override
	public void update(BoardVO vo) throws Exception {
		dao.update(vo);
	}
	
	// delete
	@Override 
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	// list
	@Override
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}
	
	// list + paging
	@Override
	public List<BoardVO> listPage(int page) throws Exception {
		return dao.listPage(page);
	}
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}
	
	// page Count
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}
	
	// Search
	@Override
	public List<BoardVO> listSearch(Criteria cri) throws Exception {
		return dao.listSearch(cri);
	}
	
	// Search page Count
	@Override
	public int listSearchCount(Criteria cri) throws Exception {
		return dao.listSearchCount(cri);		
	}
}