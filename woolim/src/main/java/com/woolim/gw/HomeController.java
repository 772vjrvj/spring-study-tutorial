package com.woolim.gw;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.woolim.dao.IprojectsDAO;
import com.woolim.dto.codes;
import com.woolim.dto.criteria;
import com.woolim.dto.pageMaker;
import com.woolim.dto.products;
import com.woolim.dto.projects;
import com.woolim.dto.workLog;
import bizbox.orgchart.service.vo.LoginVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
    private IprojectsDAO projectsDAO;   	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		LoginVO loginVO = (LoginVO)request.getSession().getAttribute("loginVO");
		System.out.println(loginVO);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
    @RequestMapping(value = "/projectsList", method = RequestMethod.GET)
    public String projectsList(Locale locale, String select1, String select2, String select3, String input, Model model, criteria cri) {
        logger.info("projectsList", locale);
        System.out.println("select1: "+select1);
        System.out.println("select2: "+select2);
        System.out.println("select3: "+select3);
        System.out.println("input: "+input);
        

        
        int count=projectsDAO.projectsListCriteriaCount(select1,select2,select3,input);

        List<projects> list=projectsDAO.projectsListCriteria(cri,select1,select2,select3,input);
        System.out.println(list);
        
        pageMaker pageMaker = new pageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(count);
        System.out.println("pageMaker: "+pageMaker);
        System.out.println("cri: "+cri);
        System.out.println("list: "+list);
        
        model.addAttribute("pageMaker", pageMaker);         
        model.addAttribute("select1",select1);
        model.addAttribute("select2",select2);  
        model.addAttribute("select3",select3);  
        model.addAttribute("input",input);  
        model.addAttribute("cri",cri);       
        model.addAttribute("list", list);
        
        return "projectsList";
    }	
    
    @RequestMapping(value = "/projectDetail", method = RequestMethod.GET)
    public String projectsDetail(String no,Locale locale, Model model) {
        int no1 = Integer.parseInt(no);
        logger.info("projectsDetail", locale);
        projects project= projectsDAO.projectGet(no1);
        String startDate = project.getProjectstartdate().toString().substring(0, 10);
        String endDate = project.getProjectenddate().toString().substring(0, 10);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("project", project);
        return "projectDetail";
    }       

  @RequestMapping(value = "/projectInsertform", method = RequestMethod.GET)
  public String projectsDetail(Locale locale, Model model) {
      logger.info("projectInsertform", locale);
      List<products> list=projectsDAO.productList();
      model.addAttribute("list", list);
      return "projectInsertform";
  }      

//  @RequestMapping(value = "/projectsUpdate", method = RequestMethod.POST)
//  public String projectsUpdate(projects projects,int no,Locale locale, Model model) {
//      logger.info("projectsDetail", locale);
//      projects.setNo(no);
//      boolean count= projectsDAO.projectsUpdate(projects);
//      model.addAttribute("projects", projects);
//      return "redirect:projectDetail?no="+projects.getNo();
//  }             

    @RequestMapping(value = "/projectsInsert", method = RequestMethod.POST)
    public String projectsInsert(projects projects,String[] chk,Locale locale, Model model) {
        logger.info("projectsInsert", locale);
        if(projects.getProjectcontract().equals("on")) {
          projects.setProjectcontract("Y");
        }
        if(projects.getSingleproduct().equals("on")) {
          projects.setSingleproduct("Y");
        }
        projects.setProjectstatus("대기");
        System.out.println("projects : " + projects);
        for (int i = 0; i < chk.length; i++) {
          System.out.println("chk"+i+":"+chk[i]);

        }
        boolean count= projectsDAO.projectsInsert(projects);
        
       
        if(chk!=null) {
          long start = System.currentTimeMillis();
          List<codes> list = new ArrayList<codes>();
            for (int i = 0; i < chk.length; i++) {
              list.add(new codes(chk[i],projects.getProjectcode(),i));
            }
            boolean count2 = projectsDAO.codesInsertList(list);
            
            long end = System.currentTimeMillis();
            System.out.println( "실행 시간 : " + ( end - start));
        }else {
          
        }        

        System.out.println("boolean : " + count);
        return "redirect:projectsList";
    }           
    
  @RequestMapping(value = "/projectsDelete", method = RequestMethod.GET)
  public String projectsUpdate(int no,Locale locale, Model model) {
      logger.info("projectsDetail", locale);
      boolean count= projectsDAO.projectsDelete(no);
      return "redirect:projectsList";
  }         
    

  @RequestMapping(value = "/businessLogList", method = RequestMethod.GET)
  public String businessLogList(Locale locale, String select2, String select3, String input, Model model, criteria cri) {
      logger.info("businessLogList", locale);
      System.out.println("select2: "+select2);
      System.out.println("select3: "+select3);
      System.out.println("input: "+input);
      
      int count=projectsDAO.workLogsListCriteriaCount(select2,select3,input);

      List<workLog> list=projectsDAO.workLogsListCriteria(cri,select2,select3,input);
      System.out.println(list);
      
      pageMaker pageMaker = new pageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(count);
      System.out.println("pageMaker: "+pageMaker);
      System.out.println("cri: "+cri);
      System.out.println("list: "+list);
      
      model.addAttribute("pageMaker", pageMaker);         
      model.addAttribute("select2",select2);  
      model.addAttribute("select3",select3);  
      model.addAttribute("input",input);  
      model.addAttribute("cri",cri);       
      model.addAttribute("list", list);
      
      return "businessLogList";
  }   
    
  @RequestMapping(value = "/businessLogDetail", method = RequestMethod.GET)
  public String businessLogDetail(String date,String id,Locale locale, Model model) {
    logger.info("businessLogDetail", locale);

    if(date==null) {
      System.out.println("null");
    }else {
      System.out.println("date : " + date +" , id : " + id );
      List<workLog> workLog= projectsDAO.businessLogGet(date,id);
      System.out.println(workLog);
      workLog workLogOne= workLog.get(0);
      System.out.println(workLogOne);
      model.addAttribute("workLog", workLog);
      model.addAttribute("workLogOne", workLogOne);
    }

      return "businessLogDetail";
  }
  
  @ResponseBody
  @RequestMapping(value = "/ajaxBusinessLogApproval", method = RequestMethod.GET)
  public Map ajaxBusinessLogApproval(String date,String id,String approval ,Locale locale, Model model) {
    logger.info("ajaxBusinessLogApproval", locale);
    System.out.println("date : " + date +" , id : " + id +" , approval : " + approval );
    
      if(approval.equals("N")) {
        approval="Y";
      }else {
        approval="N";
      }
      
      int count= projectsDAO.businessLogApprovalUpdate(date,id,approval);
      System.out.println(" , count : " + count +" , approval : " + approval );
  
      Map result = new HashMap();
      result.put("count", count);
      result.put("result", Boolean.TRUE); 
      result.put("approval", approval);
      System.out.println(result);
  
      return result;
    }     

  
  @ResponseBody
  @RequestMapping(value = "/ajaxBusinessLogApprovalList", method = RequestMethod.GET)
  public Map ajaxBusinessLogApprovalList(String date,Locale locale, Model model) {
    logger.info("ajaxBusinessLogApprovalList", locale);
    
      List<workLog> workLog= projectsDAO.businessLogApprovalList(date);
  
      System.out.println(workLog);

      Map result = new HashMap();
      result.put("workLog", workLog);
      return result;
    }     
  
  
  @ResponseBody
  @RequestMapping(value = "/ajaxBusinessLogDetailList", method = RequestMethod.GET)
  public Map ajaxBusinessLogDetailList(String date,String id ,Locale locale, Model model) {
    logger.info("ajaxBusinessLogDetailList", locale);
      List<workLog> workLog= projectsDAO.businessLogDetailList(date,id);
      System.out.println(workLog);
      Map result = new HashMap();
      result.put("workLog", workLog);
      return result;
    }       
}
