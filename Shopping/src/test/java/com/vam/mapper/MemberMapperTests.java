package com.vam.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {

    @Autowired
    private MemberMapper memberMapper;

    @Test
    public void memberIdChk() throws Exception {

    	String id = "admin23";
    	String id2 = "test123";
    	memberMapper.idCheck(id);
    	memberMapper.idCheck(id2);
       
    }
}
