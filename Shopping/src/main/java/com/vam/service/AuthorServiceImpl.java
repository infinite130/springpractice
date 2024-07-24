package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.AuthorMapper;
import com.vam.model.AuthorVO;
import com.vam.model.Criteria;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AuthorServiceImpl implements AuthorService{

	
	@Autowired
	AuthorMapper authorMapper;
	

	@Override
	public void authorEnroll(AuthorVO author) throws Exception {
		authorMapper.authorEnroll(author);
		
	}


	@Override
	public List<AuthorVO> authorGetList(Criteria cri) throws Exception {
		
		log.info("(service)authorGetList() -----" + cri);
		
		return authorMapper.authorGetList(cri);
		
	}


	@Override
	public int authorGetTotal(Criteria cri) throws Exception {
		log.info("(service)authorGetTotal()-----" + cri);
		return authorMapper.authorGetTotal(cri);
	}


	@Override
	public AuthorVO authorGetDetail(int authorId) throws Exception {
		log.info("authorgetDetail....." + authorId);
		return authorMapper.authorGetDetail(authorId);
	}


	@Override
	public int authorModify(AuthorVO author) throws Exception {
		log.info("(service) authorModify...." + author);
		return authorMapper.authorModify(author);
	}
	

}
