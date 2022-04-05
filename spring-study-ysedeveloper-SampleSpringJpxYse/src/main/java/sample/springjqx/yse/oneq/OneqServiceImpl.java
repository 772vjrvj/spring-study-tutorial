package sample.springjqx.yse.oneq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sample.springjqx.yse.jqxGridDto.Oneqcustomer;
import sample.springjqx.yse.jqxGridDto.Oneqsite;

@Service
public class OneqServiceImpl implements OneqService {

	@Autowired
	OneqDao oneqDao;
	
	@Override
	public List<Oneqcustomer> onsearch(Oneqcustomer oneqcustomer) {
		return oneqDao.onsearch(oneqcustomer);
	}
		
	@Override
	public int totalCnt(Oneqcustomer oneqcustomer) {
		return oneqDao.totalCnt(oneqcustomer);
	}
	
	@Override
	public List<Oneqsite> sitesearch(Oneqsite oneqsite) {
		return oneqDao.sitesearch(oneqsite);
	}
	
	@Override
	public List<Map<String, String>> dongCodeList(Map<String, String> map) {
		return oneqDao.dongCodeList(map);
	}
	@Override
	public List<Map<String, String>> guCodeList(Map<String, String> map) {
		return oneqDao.guCodeList(map);
	}
	
	@Override
	public List<Map<String, String>> siCodeList(Map<String, String> map) {
		return oneqDao.siCodeList(map);
	}
	
}
