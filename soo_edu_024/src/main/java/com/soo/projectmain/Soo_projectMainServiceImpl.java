package com.soo.projectmain;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;




@Service("Soo_projectMainService")
public class Soo_projectMainServiceImpl implements Soo_projectMainService{
	
	@Resource(name = "Soo_projectMainDAO")
	private Soo_projectMainDAO dao;
	 
	@Override
	public int test(Soo_projectMainVO vo) throws Exception {
		return dao.test(vo);
	}

}
