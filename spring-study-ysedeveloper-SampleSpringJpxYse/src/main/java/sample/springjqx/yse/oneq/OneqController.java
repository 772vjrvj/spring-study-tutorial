package sample.springjqx.yse.oneq;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sample.springjqx.yse.jqxGridDto.Oneqcustomer;

@Controller
public class OneqController {
	
	@Autowired
	OneqService oneqService;
	private static Logger log = LoggerFactory.getLogger(OneqController.class);
	
	@RequestMapping(value = "/oneqMain1", method = RequestMethod.GET)
	public ModelAndView oneqMain1() {
		log.info("oneqMain1 start");
		return new ModelAndView("oneq/oneqMain1");
	}
	
	@ResponseBody
	@RequestMapping(value = "/oneqMain1/oneqsiteList", method = RequestMethod.POST)
	public List<Map<String, String>> oneqsiteList(@RequestBody Map<String, String> reqData) {
		log.info("oneqsite : {}",reqData);
		
		List<Map<String, String>> resultList = new ArrayList<Map<String,String>>();
		
		try {
			String site = (String)reqData.get("site");
			
			if(site != null &&!"".equals(site)) {
				
				if(site.equals("si")) {
					resultList = oneqService.siCodeList(reqData);
				}
				
				if(site.equals("gu")) {
					resultList = oneqService.guCodeList(reqData);
				}
				
				if(site.equals("dong")) {
					resultList = oneqService.dongCodeList(reqData);
				}

			}
		} catch (Exception e) {
			log.info("error : {}",e.getMessage());
		}
		

		return resultList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/oneqMain1/onsearch", method = RequestMethod.POST)
	public Map oneqMain1onsearch( @RequestBody Oneqcustomer oneqcustomer) {
		Map<String, Object> result = new HashMap<>();

		oneqcustomer.setStartPage(oneqcustomer.getPage() * oneqcustomer.getRowsCount());
		List<Oneqcustomer> resultList = oneqService.onsearch(oneqcustomer);
		int totalCnt = oneqService.totalCnt(oneqcustomer);
		
		int page = oneqcustomer.getPage()+1;
		int rowsCount = oneqcustomer.getRowsCount();
		
		result.put("result", resultList);
		result.put("page", page);
		result.put("rowsCount", rowsCount);
		result.put("totalCount", totalCnt);
		
		return result;
	}
	
}
