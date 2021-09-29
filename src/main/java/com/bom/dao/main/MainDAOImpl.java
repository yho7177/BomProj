package com.bom.dao.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bom.domain.Finished;
import com.bom.domain.Product;
import com.bom.domain.Recipe;

@Repository
public class MainDAOImpl implements MainDAO {
	@Inject
	private SqlSession ses;
	
	public static final String NS = "com.bom.mainmap";
	@Override
	public Finished selectFinished(String no) throws Exception {
		return ses.selectOne(NS + ".selectFinished", no);
	}
	@Override
	public int noCheck(String no) throws Exception {
		return ses.selectOne(NS + ".noCheck", no);
	}
	@Override
	public int recipeCheck(String recipe) throws Exception {
		return ses.selectOne(NS + ".recipeCheck", recipe);
	}
	@Override
	public int addProduct(Finished finished, Recipe recipe) throws Exception {
		if (ses.insert(NS + ".addProduct", finished) == 1) {
			if(ses.insert(NS + ".addProduct2", recipe) == 1) {
				return 1;
			}
		}
		return 0;
	}
	@Override
	public List<Finished> productAll() throws Exception {
		return ses.selectList(NS + ".productAll");
	}
	@Override
	public int forrecipe(Recipe recipe) throws Exception {
		
		return ses.insert(NS + ".forrecipe", recipe);
	}
	@Override
	public List<Recipe> getTree(String rno) throws Exception {
		return ses.selectList(NS + ".getTree", rno);
	}
	@Override
	public Product selectedTree(String no) throws Exception {
		return ses.selectOne(NS + ".selectedTree", no);
	}

}
