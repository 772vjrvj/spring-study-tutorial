package sample.springjqx.yse.oneq;

import java.util.List;
import java.util.Map;

import sample.springjqx.yse.jqxGridDto.Oneqcustomer;
import sample.springjqx.yse.jqxGridDto.Oneqsite;

public interface OneqService {

	public List<Oneqcustomer> onsearch(Oneqcustomer oneqcustomer);
	
	public int totalCnt(Oneqcustomer oneqcustomer);

	public List<Oneqsite> sitesearch(Oneqsite oneqsite);
	
	public List<Map<String, String>> guCodeList(Map<String, String> map);
	
	public List<Map<String, String>> dongCodeList(Map<String, String> map);
	
	public List<Map<String, String>> siCodeList(Map<String, String> map);
	
}
