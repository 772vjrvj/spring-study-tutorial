package org.zerock.mapper;

import org.apache.ibatis.annotations.Insert;

public interface SampleMapper {

	@Insert("insert into grade values(100000,'롤백회원2')")
	public int insertCol();
}
