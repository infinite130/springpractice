package com.vam.mapper;

import com.vam.model.MemberVO;

public interface MemberMapper {
    void memberJoin(MemberVO member);
    
    public int idCheck(String memberId);
    
    public MemberVO memberLogin(MemberVO member);
}
