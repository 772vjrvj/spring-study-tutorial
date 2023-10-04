package com.woolim.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.woolim.dto.codes;
import com.woolim.dto.criteria;
import com.woolim.dto.products;
import com.woolim.dto.projects;
import com.woolim.dto.workLog;


@Repository
public class projectsDAOImp implements IprojectsDAO{

  @Autowired
  private SqlSessionTemplate sqlSession;
  private String namespace="com.woolim.";   

  @Override
  public List<projects> projectsList() {
    List<projects>list=new ArrayList<projects>();
    list=sqlSession.selectList(namespace+"projectsList");
    return list;
  }
  
  @Override
  public projects projectGet(int no) {
    return sqlSession.selectOne(namespace+"projectGet",no);
  } 
  
  @Override
  public boolean projectsInsert(projects projects) {
    int count1 = 0;
    
    count1=sqlSession.insert(namespace+"projectsInsert", projects);

    return count1  >0 ? true : false;
  }

  @Override
  public boolean codesInsert(codes codes) {
    int count = 0;
    
    count=sqlSession.insert(namespace+"codesInsert", codes);

    return count  >0 ? true : false;
  };

  @Override
  public boolean codesInsertList(List<codes> list) {
    int count = 0;
   
    count=sqlSession.insert(namespace+"codesInsertList", list);
    
    return count  >0 ? true : false;
  }

  
  
  
  @Override
  public boolean projectsUpdate(projects projects) {
      int count = 0;
      count=sqlSession.insert(namespace+"projectsUpdate", projects);
      return count > 0 ? true : false;
  }
  @Override
  public boolean projectsDelete(int no) {
      int count=0;
      count=sqlSession.delete(namespace+"projectsDelete",no);
      return count>0?true:false;
  }

  
  @Override
  public List<products> productList() {
    List<products>list=new ArrayList<products>();
    list=sqlSession.selectList(namespace+"productsList");
    return list;
  }  
  
  @Override
  public int projectsListCriteriaCount(String select1, String select2, String select3, String input) {
    Map map = new HashMap();
        map.put("select1", select1);
        map.put("select2", select2);
        map.put("select3", select3);
        map.put("input", input);
    int count=sqlSession.selectOne(namespace+"projectsListCriteriaCount", map);
    return count;       
  };
  
  @Override
  public List<projects> projectsListCriteria(criteria cri, String select1, String select2, String select3, String input){
    List<projects>list=new ArrayList<projects>();
    Map map = new HashMap();
    map.put("select1", select1);
    map.put("select2", select2);
    map.put("select3", select3);
    map.put("input", input);
    map.put("pageStart", cri.getPageStart());
    map.put("perPageNum", cri.getPerPageNum());
    list=sqlSession.selectList(namespace+"projectsListCriteria", map);
    return list;        
};
    
  
@Override
public int workLogsListCriteriaCount(String select2, String select3, String input) {
  Map map = new HashMap();
      map.put("select2", select2);
      map.put("select3", select3);
      map.put("input", input);
  int count=sqlSession.selectOne(namespace+"workLogsListCriteriaCount", map);
  return count;       
};

@Override
public List<workLog> workLogsListCriteria(criteria cri, String select2, String select3, String input){
    List<workLog>list=new ArrayList<workLog>();
    Map map = new HashMap();
    map.put("select2", select2);
    map.put("select3", select3);
    map.put("input", input);
    map.put("pageStart", cri.getPageStart());
    map.put("perPageNum", cri.getPerPageNum());
    list=sqlSession.selectList(namespace+"workLogsListCriteria", map);
    return list;        
};  


@Override
  public List<workLog> businessLogGet(String date, String id) {
    System.out.println("dd");
    List<workLog>list=new ArrayList<workLog>();
    Map map = new HashMap();
    map.put("date", date);
    map.put("id", id);
    list = sqlSession.selectList(namespace+"businessLogGet",map);
    System.out.println(list);
    return list;
  } 
  
  
  @Override
  public int businessLogApprovalUpdate(String date,String id,String approval) {
    Map map = new HashMap();
    map.put("date", date);
    map.put("id", id);    
    map.put("approval", approval);
    int count=sqlSession.update(namespace+"businessLogApprovalUpdate", map);
    return count;
  }
  
  @Override  
  public List<workLog> businessLogApprovalList(String date){
    List<workLog>list=new ArrayList<workLog>();
    list=sqlSession.selectList(namespace+"businessLogApprovalList", date);
    return list;        
  }
  @Override
  public List<workLog> businessLogDetailList(String date,String id){
    List<workLog>list=new ArrayList<workLog>();
    Map map = new HashMap();
    map.put("date", date);
    map.put("id", id);    
    list=sqlSession.selectList(namespace+"businessLogDetailList", map);
    return list;           
  }

  
  
}
