package com.bom.service.main;

import java.util.List;

import com.bom.domain.Finished;
import com.bom.domain.Product;
import com.bom.domain.Recipe;

public interface MainService {

	Finished selectFinished(String no) throws Exception;

	int noCheck(String no) throws Exception;

	int recipeCheck(String recipe) throws Exception;

	int addProduct(Finished finished, Recipe recipe) throws Exception;

	List<Finished> productAll() throws Exception;

	int forrecipe(Recipe recipe) throws Exception;

	List<Recipe> getTree(String rno) throws Exception;

	Product selectedTree(String no) throws Exception;

	List<Product> keyupProduct(String key) throws Exception;

}
