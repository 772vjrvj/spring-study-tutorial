package sample.springjqx.yse.oneq;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sample.springjqx.yse.jqxGridDto.Oneqcustomer;
import sample.springjqx.yse.jqxGridDto.Oneqsite;

@Repository
public class OneqDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<Oneqcustomer> onsearch(Oneqcustomer oneqcustomer){
		return this.sqlSessionTemplate.selectList("oneq.onsearch", oneqcustomer);
	}
	
	
	public int totalCnt(Oneqcustomer oneqcustomer) {
		return this.sqlSessionTemplate.selectOne("oneq.totalCnt", oneqcustomer);
	}
	
	public List<Oneqsite> sitesearch(Oneqsite oneqsite){
		return this.sqlSessionTemplate.selectList("oneq.sitesearch", oneqsite);
	}
	
	public List<Map<String, String>> guCodeList(Map<String, String> map) {
	    return this.sqlSessionTemplate.selectList("oneq.guCodeList", map);
	}
	
	public List<Map<String, String>> dongCodeList(Map<String, String> map) {
	    return this.sqlSessionTemplate.selectList("oneq.dongCodeList", map);
	}
	
	public List<Map<String, String>> siCodeList(Map<String, String> map) {
	    return this.sqlSessionTemplate.selectList("oneq.siCodeList", map);
	}
	
	
}

