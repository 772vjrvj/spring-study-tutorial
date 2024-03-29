package com.hk.toCheckFinal.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.toCheckFinal.dtos.HcAnsDto;
import com.hk.toCheckFinal.dtos.HcChkDto;
import com.hk.toCheckFinal.dtos.HcCriteria;
import com.hk.toCheckFinal.dtos.HcDto;
import com.hk.toCheckFinal.dtos.HcInChkDto;
import com.hk.toCheckFinal.dtos.HcLoginDto;

@Repository
public class HcDaoImp implements IHcDao {

	@Override	
	public boolean noticeBoardInsert(HcAnsDto HcAnsDto) {
		System.out.println("noticeBoardInsert");
		int count = 0;
		count=sqlSession.insert(namespace+"noticeBoardInsert", HcAnsDto);
		return count > 0 ? true : false;
	}

	@Override	
	public boolean noticeBoardUpdate(HcAnsDto HcAnsDto) {
		System.out.println("noticeBoardUpdate");
		int count = 0;
		count=sqlSession.update(namespace+"noticeBoardUpdate", HcAnsDto);
		return count > 0 ? true : false;
	}

	@Override	
	public List<HcAnsDto> noticeBoardList() {
		System.out.println("noticeBoardList");
		List<HcAnsDto>list=new ArrayList<HcAnsDto>();
		list=sqlSession.selectList(namespace+"noticeBoardList");
		return list;
	}   		

	@Override
	public HcAnsDto noticeBoardGet(int seq) {
		System.out.println("noticeBoardGet");
		return sqlSession.selectOne(namespace+"noticeBoardGet", seq);
	}	

	@Override	
	public boolean noticeBoardDelete(int seq) {
		System.out.println("noticeBoardDelete");
		int count = 0;
		count=sqlSession.update(namespace+"noticeBoardDelete", seq);
		return count > 0 ? true : false;
	}
	

	@Override	
	public boolean replyBoardUpdate(int seq) {
		System.out.println("replyBoardUpdate");
		int count = 0;
		count=sqlSession.update(namespace+"replyBoardUpdate", seq);
		return count > 0 ? true : false;
	}

	@Override	
	public boolean replyBoardInsert(HcAnsDto HcAnsDto) {
		System.out.println("replyBoardInsert");
		int count = 0;
		count=sqlSession.insert(namespace+"replyBoardInsert", HcAnsDto);
		return count > 0 ? true : false;
	}	
	
	public boolean readCount(int seq) {
		System.out.println("readCount");
		int count = 0;
		count=sqlSession.insert(namespace+"readCount", seq);
		return count > 0 ? true : false;		
	}
	
	
	
	
	
	
	
	
	
	//V
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.hk.toCheckFinal.";   
	
	//V아아디 체크
	@Override
	public HcLoginDto idChk(String id) {
		System.out.println("HcDaoImp idChk");
		Map<String, String>map= new HashMap<String, String>();
		map.put("id", id);
		return sqlSession.selectOne(namespace+"idChk", map);
	}
	
	//V회원가입
	@Override
    public boolean insertUser(HcLoginDto dto) {
		System.out.println("HcDaoImp insertUser");
		int count = 0;
		count=sqlSession.insert(namespace+"insertUser", dto);
		return count>0?true:false;
    }
	
	//V아이디 찾기 
	@Override
	public HcLoginDto findId(String name,String phone) {
		System.out.println("HcDaoImp findId");
		Map<String, String>map= new HashMap<String, String>();
		map.put("name", name);
		map.put("phone", phone);
		System.out.println("ddd1");
		return sqlSession.selectOne(namespace+"findId",map);
	}
	
	//V비밀번호찾기 아이디와 핸드폰 번호로 본인인증
	@Override
	public HcLoginDto findPw(String id,String phone) {
		System.out.println("HcDaoImp findPw");
		Map<String, String>map= new HashMap<String, String>();
		map.put("id", id);
		map.put("phone", phone); 
		return sqlSession.selectOne(namespace+"findPw",map);
	}
	   
	//V비밀번호 찾기 아이디에 맞는 질문 찾기
	@Override
	public HcLoginDto findPw_find(String id) {
		System.out.println("HcDaoImp findPw_find");
		return sqlSession.selectOne(namespace+"findPw_find",id);
	}
	   
	//V비밀번호찾기 질문에 맞는 답변인지 검사하고  비밀번호 출력해주기
	@Override
	public HcLoginDto findPw_After(String question,String answer) {
		System.out.println("HcDaoImp findPw_After");
		Map<String, String> map = new HashMap<String, String>();
		map.put("question", question);
		map.put("answer",  answer);
		return sqlSession.selectOne(namespace+"findPw_After",map);
	}
	   
	//V로그인
	@Override
	public HcLoginDto getLogin(String id, String password) {
		System.out.println("HcDaoImp getLogin");
		Map<String, String> map = new HashMap<String, String>();
		map.put( "id", id );
		map.put( "password", password );
		return sqlSession.selectOne(namespace+"getLogin",map);
	}	
	
	//V유저 정보 얻기
	@Override
	public HcLoginDto getUser(String id) {
		System.out.println("HcDaoImp getUser");
		return sqlSession.selectOne(namespace+"getUser", id);
	}	

	//V기간이 종료되지 않은 모든 유저들의 리스트
	@Override
	public List<HcDto> getAllListEvery() {
		System.out.println("HcDaoImp getAllListEvery");
		List<HcDto>list=new ArrayList<HcDto>();
		list=sqlSession.selectList(namespace+"getAllListEvery");
		return list;
	}   	
	
	//V리스트 종료(삭제아님 날짜가 지난 리스트 종료)
	@Override
	public boolean updateEndList(HcDto dto) {
		System.out.println("HcDaoImp updateEndList");
		int count=0;
		count=sqlSession.update(namespace+"updateEndList", dto);
		return count>0?true:false;
	}	
	
	//V참가하기 인원 받기
	@Override
	public int habitCalIntoPerCount(String intoper) {
		System.out.println("HcDaoImp habitCalIntoPerCount");
		int intoper1=sqlSession.selectOne(namespace+"habitCalIntoPerCount", intoper);
		return intoper1;
	}
	
	//V습관달력 삭제
	@Override
	public boolean habitCalDeleteAll(String pKey) {
		System.out.println("HcDaoImp habitCalDeleteAll");
		int count=0;
		count=sqlSession.delete(namespace+"habitCalDeleteAll",pKey);
		return count>0?true:false;
	}   	
	
	//V인증 페이지들 모두 삭제
	@Override
	public boolean deleteHcInChkAll(String pKey) {
		System.out.println("HcDaoImp deleteHcInChkAll");
		int count = 0;
		count=sqlSession.update(namespace+"deleteHcInChkAll", pKey);
		return count > 0 ? true : false;
	}	
	
	//V로그인한 유저 한명의 종료되지 않은 리스트
	@Override
	public List<HcDto> getAllList(String id) {
		System.out.println("HcDaoImp getAllList");
		List<HcDto>list=new ArrayList<HcDto>();
		list=sqlSession.selectList(namespace+"getAllList",id);
		return list;
	}	
	
	//V습관달력 만들기 값 입력 habitCalInsert
	@Override
	public boolean habitCalInsert(HcDto HcDto) {
		System.out.println("HcDaoImp habitCalInsert");		
		int count=0;
		count=sqlSession.insert(namespace+"habitCalInsert", HcDto);
		return count>0?true:false;
	}	
	
	//V참가한 사람 그 습관달력의 모든 기간에 대한 상세인증페이지 만들기
	@Override
	public boolean insertHcInChk(HcInChkDto HcInChkDto) {
		System.out.println("HcDaoImp insertHcInChk");				
		int count = 0;
		count=sqlSession.insert(namespace+"insertHcInChk", HcInChkDto);
		return count>0?true:false;      
	}   	

	//Vsort업데이트 방금 본걸 main에서 맨 앞화면으로 보려고
	public boolean updateSort(String sort, String pKey) {
		System.out.println("HcDaoImp updateSort");						
		Map<String, String> map = new HashMap<String, String>();
		map.put( "sort", sort );
		map.put( "pKey", pKey );
		int count=0;
		count =sqlSession.update(namespace+"updateSort", map);
		return count>0?true:false;		
	}
	
	//V습관달력 한개 구하기
	@Override
	public HcDto getHabitCalListOne(String pKey,String id) {
		System.out.println("HcDaoImp getHabitCalListOne");								
		Map<String, String> map = new HashMap<String, String>();
		map.put( "pKey", pKey );
		map.put( "id", id );	
		System.out.println("pKey"+ pKey+"id"+id);
	return sqlSession.selectOne(namespace+"getHabitCalListOne",map);

   }	
	
	//VpKey가 같은 습관달력 구하기
	@Override
	public List<HcDto> getHabitCalList(String pKey) {
	System.out.println("HcDaoImp getHabitCalList");									   
	return sqlSession.selectList(namespace+"getHabitCalList",pKey);

   }   	
	
	//V체크 값들 가저오기
	@Override
	public List<String> habitCalTakeChk(String pKey) {
		System.out.println("HcDaoImp habitCalTakeChk");										
		List<String>list=new ArrayList<String>();
		list=sqlSession.selectList(namespace+"habitCalTakeChk", pKey);
		return list;
	}
	
	//V체크 삭제하기
	@Override
	public boolean habitCalChkDelete(String pKey,String chk) {
		System.out.println("HcDaoImp habitCalChkDelete");												
		Map<String, String> map = new HashMap<String, String>();
		map.put( "pKey", pKey );
		map.put( "chk", chk );
		int count = 0;
		count=sqlSession.delete(namespace+"habitCalChkDelete", map);
		System.out.println("HcDaoImp habitCalChkDelete count" + count);												
		
		return count > 0 ? true : false;		
	}	

	//V체크 갯수 세기
	@Override
	public int habitCalChkCount(String pKey) {
		System.out.println("HcDaoImp habitCalChkCount");														
		int count=sqlSession.selectOne(namespace+"habitCalChkCount", pKey);
		return count;
	}
	
	//V체크 갯수 업데이트
	public boolean updateChkCount(HcDto HcDto) {
		System.out.println("HcDaoImp updateChkCount");																
	      int count = 0;
	      count=sqlSession.update(namespace+"updateChkCount", HcDto);
	      return count > 0 ? true : false;
	}   	
	
	//V체크 값 입력
	@Override	
	public boolean habitCalInsertChk(String pKey,String chk) {
		System.out.println("HcDaoImp habitCalInsertChk");																
		Map<String, String> map = new HashMap<String, String>();
		map.put( "pKey", pKey );
		map.put( "chk", chk );
		int count=0;
		count =sqlSession.insert(namespace+"habitCalInsertChk", map);
		return count>0?true:false;
	}
	
	//V혼자하기 공개 비공개 여부
	@Override
	public boolean updateCalWith(HcDto HcDto) {
		System.out.println("HcDaoImp updateCalWith");																
		int count=0;
		count =sqlSession.update(namespace+"updateCalWith", HcDto);
		return count>0?true:false;		
	}	
	
	//V해당 아이디 습관달력 삭제
	@Override
	public boolean habitCalDelete(String pKey,String id) {
		System.out.println("HcDaoImp habitCalDelete");																		
		Map<String, String> map = new HashMap<String, String>();
		map.put( "pKey", pKey );
		map.put( "id", id );
		int count=0;
		count=sqlSession.delete(namespace+"habitCalDelete",map);
		return count>0?true:false;
	}   	

	//V해당 아이디 인증 페이지들 모두 삭제
	@Override
	public boolean deleteHcInChk(String pKey,String id) {
		System.out.println("HcDaoImp deleteHcInChk");																				
		Map<String, String> map = new HashMap<String, String>();
		map.put( "pKey", pKey );
		map.put( "id", id );
		int count = 0;
		count=sqlSession.update(namespace+"deleteHcInChk", map);
		return count > 0 ? true : false;
	}

	
	
	
	
	
	
	
	
	//V모든 회원들의 '혼자' 하기 리스트 보기
	@Override
	public List<HcDto> getAllHcListAlone() {
		System.out.println("HcDaoImp getAllHcListAlone");																						
		List<HcDto>list=new ArrayList<HcDto>();

		list=sqlSession.selectList(namespace+"getAllHcListAlone");
		return list;
	}	
	
	//V모든 회원들의 '함께' 하기 리스트 보기
	@Override
	public List<HcDto> getAllHcListWith() {
		System.out.println("HcDaoImp getAllHcListWith");																								
		List<HcDto>list=new ArrayList<HcDto>();

		list=sqlSession.selectList(namespace+"getAllHcListWith");
		return list;
	}   	
	
	

	
	
	
	
	
	
	
	
	public List<HcDto> listCriteriaWith(HcCriteria cri){
		System.out.println("listCriteriaWith");																				
		List<HcDto>list=new ArrayList<HcDto>();

		list=sqlSession.selectList(namespace+"listCriteriaWith", cri);
		return list;		
	};
	
	

	public List<HcDto> listCriteria(HcCriteria cri, String select1,String input2, String withh){
		System.out.println("listCriteria");																				
		List<HcDto>list=new ArrayList<HcDto>();
		Map map = new HashMap();
		
		if(select1==null) {
			map.put("select1", "ID");
		}else {
			map.put("select1", select1.toUpperCase());			
		}
		if(input2==null) {
			map.put("input2", "");
		}else {
			map.put("input2", input2);			
		}
		
		map.put("withh", withh);
		map.put("pageStart", cri.getPageStart());
		map.put("pageEnd", cri.getPageEnd());
		list=sqlSession.selectList(namespace+"listCriteria", map);
		System.out.println(list);
		return list;		
	};
		
	
	
	public int listCriteriaCount(String select1,String input2, String withh){
		System.out.println("listCriteriaCount");																				
		Map<String, String> map = new HashMap<String, String>();
		
		if(select1==null) {
			map.put("select1", "ID");
		}else {
			map.put("select1", select1.toUpperCase());
			System.out.println(select1);																			
		}
		
		if(input2==null) {
			map.put("input2", "");
		}else {
			map.put("input2", input2);	
			System.out.println(input2);																			

		}		
		map.put("withh", withh);
		System.out.println(map.get("withh"));
		System.out.println(map.get("select1"));
		System.out.println(map.get("input2"));
		int count=sqlSession.selectOne(namespace+"listCriteriaCount", map);
		System.out.println(count);
		return count;		
	};
			
	
	
	//V아이디 검색
	@Override
	public List<HcDto> getSearchID(String searchId, String withh) {
		System.out.println("HcDaoImp getSearchID");																								
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", searchId);
		map.put("withh", withh);
		System.out.println("id:"+searchId+withh);

		return sqlSession.selectList(namespace+"getSearchID",map);
	}
   
	//V제목 검색
	@Override
	public List<HcDto> getSearchTitle(String searchTitle, String withh) {
		System.out.println("HcDaoImp getSearchTitle");																										
		Map<String, String> map = new HashMap<String, String>();
		map.put("title", searchTitle);
		map.put("withh", withh);
		System.out.println("title:"+searchTitle+withh);
		return sqlSession.selectList(namespace+"getSearchTitle",map);
	};
   
	//V기간 검색
	@Override
	public List<HcDto> getSearchTerm(String searchTerm, String withh) {
		System.out.println("HcDaoImp getSearchTerm");																												
		Map<String, String> map = new HashMap<String, String>();
		map.put("term", searchTerm);
		map.put("withh", withh);
		System.out.println("term:"+searchTerm+withh);
		return sqlSession.selectList(namespace+"getSearchTerm",map);
	};

	//V시작일 검색
	@Override
	public List<HcDto> getSearchStartDate(String searchStartDate, String withh) {
		System.out.println("HcDaoImp getSearchStartDate");																														
		Map<String, String> map = new HashMap<String, String>();
		map.put("stDate", searchStartDate);
		map.put("withh", withh);
		System.out.println("term:"+searchStartDate+withh);
		return sqlSession.selectList(namespace+"getSearchStartDate",map);
	};	
	
	//V해당일 인증해야 하는 것들 다 가지고 오기
	@Override
	public List<HcInChkDto> getHcInChk(HcInChkDto HcInChkDto){
		System.out.println("HcDaoImp getHcInChk");																																
		List<HcInChkDto>list=new ArrayList<HcInChkDto>();
		list=sqlSession.selectList(namespace+"getHcInChk",HcInChkDto);
		return list;      
	}	
	
	//V인증값 가저오기
	@Override
	public HcInChkDto getHcUserInChk(HcInChkDto HcInChkDto){
		System.out.println("HcDaoImp getHcUserInChk");																																		
		return sqlSession.selectOne(namespace+"getHcUserInChk",HcInChkDto);      
	}   	
	
	//V인증사진 올리기
	@Override
	public boolean updateHcInChk(HcInChkDto HcInChkDto) {
		System.out.println("HcDaoImp updateHcInChk");																																				
		int count = 0;
		count=sqlSession.update(namespace+"updateHcInChk", HcInChkDto);
		return count > 0 ? true : false;
	}
	
	
	//V인증 삭제
	@Override
	public boolean deleteHcUserInChk(HcInChkDto HcInChkDto){
		System.out.println("HcDaoImp deleteHcUserInChk");
		int count = 0;
		count=sqlSession.update(namespace+"deleteHcUserInChk",HcInChkDto); 
		return count>0?true:false;        
	}      
	
	//V랭킹
	@Override
	public List<HcDto> boardlistWithRanking() {
		System.out.println("HcDaoImp boardlistWithRanking");
		List<HcDto>list=new ArrayList<HcDto>();
		list=sqlSession.selectList(namespace+"boardlistWithRanking");
		return list;
	} 	
	
	
	
	//V유저 정보 변경
	@Override
	public boolean updateUser(HcLoginDto dto) {
		System.out.println("HcDaoImp updateUser");		
		int count = 0;
		count=sqlSession.update(namespace+"updateUser", dto);
		return count > 0 ? true : false;
	}
	
	//V탈퇴하기
	@Override
	public boolean deleUser(String id) {
		System.out.println("HcDaoImp deleUser");				
		int count = 0;
		count=sqlSession.update(namespace+"deleUser", id);
		return count > 0 ? true : false;
	}
	
	//V탈퇴한 아이디 리스트 지우기
	@Override
	public boolean deleList(String id) {
		System.out.println("HcDaoImp deleList");						
		int count = 0;
		count=sqlSession.update(namespace+"deleList", id);
		return count > 0 ? true : false;
	}	

	//V종료일이 지난 모든 리스트들 가저오기
	@Override
	public List<HcDto> getAllListEndY(String id) {
		System.out.println("HcDaoImp getAllListEndY");						
		List<HcDto>list=new ArrayList<HcDto>();
		list=sqlSession.selectList(namespace+"getAllListEndY",id);
		return list;
	}   
   

   
   @Override   
   public List<HcLoginDto> getAllUser() {
      List<HcLoginDto> list = new ArrayList<HcLoginDto>();
      list=sqlSession.selectList(namespace+"getAllUser");   
      return list;
   }

   @Override
   public boolean updateRoleUser(String id, String role,String enabled) {
      Map<String, String> map = new HashMap<String, String>();
      int count = 0;
      map.put( "id", id );
      map.put( "role", role );
      map.put( "enabled", enabled );
      count=sqlSession.insert(namespace+"updateRoleUser", map);
      return count > 0 ? true : false;
   }

   


}