package com.woolim.dao;

import java.util.List;
import com.woolim.dto.codes;
import com.woolim.dto.criteria;
import com.woolim.dto.products;
import com.woolim.dto.projects;
import com.woolim.dto.workLog;

public interface IprojectsDAO {

  public List<projects> projectsList();    
  
 public int projectsListCriteriaCount(String select1, String select2, String select3, String input);

 public List<projects> projectsListCriteria(criteria cri, String select1, String select2, String select3, String input);

  public boolean projectsInsert(projects projects);
  
  public boolean codesInsert(codes codes);
  
  public boolean codesInsertList(List<codes> list);  
 
  public boolean projectsUpdate(projects projects);

  public boolean projectsDelete(int no);
  
  public projects projectGet(int seq);
  
  public List<products> productList();      

  public int workLogsListCriteriaCount(String select2, String select3, String input);
  
  public List<workLog> workLogsListCriteria(criteria cri, String select2, String select3, String input);    
  
  public List<workLog> businessLogGet(String date,String id);   
  
  public int businessLogApprovalUpdate(String date,String id,String approval);   
  
  public List<workLog> businessLogApprovalList(String date);   

  public List<workLog> businessLogDetailList(String date,String id);   

  
  
  
}
