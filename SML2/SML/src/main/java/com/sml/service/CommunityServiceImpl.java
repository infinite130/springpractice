package com.sml.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sml.mapper.CommunityMapper;
import com.sml.mapper.CommunityReplyMapper;
import com.sml.model.CommunityReplyDTO;
import com.sml.model.CommunityVO;
import com.sml.model.Criteria;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	CommunityMapper mapper;
	
	@Autowired
	CommunityReplyMapper replyMapper;

	@Override
	public void communityEnroll(CommunityVO community) throws Exception {
		mapper.communityEnroll(community);
	}

	@Override
	public List<CommunityVO> getBoardList(Criteria cri) throws Exception {
		log.info("(service)getBoardList()......." +cri);
		return mapper.getBoardList(cri);
	}
	@Override
	public int communityGetTotal(Criteria cri) throws Exception {
		log.info("(service)communityGetTotal()......" +cri);
		return mapper.communityGetTotal(cri);
	}

	@Override
	public CommunityVO communityDetail(int commCode) throws Exception {
		log.info("상세 페이지 접속......" +commCode);
		return mapper.communityDetail(commCode);
	}

	@Override
	public int communityModify(CommunityVO community) throws Exception {
		log.info("(service) modify....." +community);
		return mapper.communityModify(community);
	}

	@Override
	public int communityDelete(int commCode) {
		log.info("Delete......");
		return mapper.communityDelete(commCode);
	}

	@Override
	public CommunityVO getCommunityCode(int commCode) {
		return mapper.getCommunityCode(commCode);
	}

	@Override
	public int enrollReply(CommunityReplyDTO dto) {
		int result = replyMapper.enrollReply(dto);
		return replyMapper.enrollReply(dto);
	}


}
