package com.bom.service.main;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bom.dao.main.MainDAO;
import com.bom.domain.Finished;
import com.bom.domain.Product;
import com.bom.domain.Recipe;

@Service
public class MainServiceImpl implements MainService {
	@Inject
	private MainDAO dao;
	
	@Override
	public Finished selectFinished(String no) throws Exception {
		return dao.selectFinished(no);
	}

	@Override
	public int noCheck(String no) throws Exception {
		return dao.noCheck(no);
	}

	@Override
	public int recipeCheck(String recipe) throws Exception {
		return dao.recipeCheck(recipe);
	}

	@Override
	public int addProduct(Finished finished, Recipe recipe) throws Exception {
		return dao.addProduct(finished, recipe);
	}

	@Override
	public List<Finished> productAll() throws Exception {
		return dao.productAll();
	}

	@Override
	public int forrecipe(Recipe recipe) throws Exception {
		return dao.forrecipe(recipe);
	}

	@Override
	public List<Recipe> getTree(String rno) throws Exception {
		return dao.getTree(rno);
	}

	@Override
	public Product selectedTree(String no) throws Exception {
		return dao.selectedTree(no);
	}

	
	
}
