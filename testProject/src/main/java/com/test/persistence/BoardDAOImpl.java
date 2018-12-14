package com.test.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.domain.BoardVO;
import com.test.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	// mybatis
	@Inject
	private SqlSession sql;
	
	// mapper
	private static String namespace = "com.test.mappers.boardMapper";
	
	// create
	@Override
	public void create(BoardVO vo) throws Exception {
		sql.insert(namespace +".create", vo);
	}
	
	// read
	@Override
	public BoardVO read(int bno) throws Exception {
		return sql.selectOne(namespace +".read", bno);
	}
	
	// update
	@Override
	public void update(BoardVO vo) throws Exception {
		sql.update(namespace +".update", vo);
	}
	
	// delete
	@Override
	public void delete(int bno) throws Exception {
		sql.delete(namespace +".delete", bno);
	}
	
	// list
	@Override
	public List<BoardVO> list() throws Exception {
		return sql.selectList(namespace +".list");
	}
	
	// list + paging
	@Override
	public List<BoardVO> listPage(int page) throws Exception {
		if(page <= 0) {
			page = 1;
		}
		page = (page -1) * 10;
		return sql.selectList(namespace + ".listPage", page);
	}
	
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return sql.selectList(namespace+".listCriteria", cri);
	}
	
	// page Count
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return sql.selectOne(namespace+".countPaging", cri);
	}
	
	// Search
	@Override
	public List<BoardVO> listSearch(Criteria cri) throws Exception {
		return sql.selectList(namespace+".listSearch", cri);
	}
	
	// Search Page Count
	@Override
	public int listSearchCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace+".listSearchCount", cri);
	}
}