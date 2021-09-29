package com.bom.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.bom.domain.Finished;
import com.bom.domain.Product;
import com.bom.domain.Recipe;
import com.bom.etc.Upload;
import com.bom.service.main.MainService;

@Controller
public class MainController {
	@Inject
	private MainService service;
	
	@RequestMapping("/")
	public String main(Model model) {
		try {
			List<Finished> lst = service.productAll();
			model.addAttribute("finished", lst);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "treeView";
	}
	
	@RequestMapping(value = "/finishedInfo", method = RequestMethod.GET)
	public void finishedInfo(@RequestParam("no")String no, HttpServletResponse resp) throws IOException {
		JSONObject obj = new JSONObject();
		try {
			Finished pro = service.selectFinished(no);
			obj.put("result", "success");
			obj.put("no", pro.getProductno());
			obj.put("title", pro.getTitle());
			obj.put("brick", pro.getBrick());
			Date tmp = Date.valueOf(pro.getRelease().toString());
			String time = tmp.toString();
			obj.put("release", time);
			obj.put("recipe", pro.getRecipeno());
			obj.put("series", pro.getSeries());
			obj.put("img", pro.getImg());
		} catch (Exception e) {
			obj.put("result", "fail");
			e.printStackTrace();
		}
		resp.getWriter().print(obj);
	}
	
	@RequestMapping("/noCheck")
	public void noCheck(@RequestParam("no")String no, HttpServletResponse resp) throws IOException {
		JSONObject obj = new JSONObject();
		
		try {
			int productno = service.noCheck(no);
			if(productno > 0) {
				obj.put("result", "fail");
			} else if (productno == 0) {
				obj.put("result", "success");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.getWriter().print(obj);
	}
	
	@RequestMapping("/recipeCheck")
	public void recipeCheck(@RequestParam("recipe")String recipe, HttpServletResponse resp) throws IOException {
		JSONObject obj = new JSONObject();
		
		try {
			int i = service.recipeCheck(recipe);
			if(i > 0) {
				obj.put("result", "fail");
			} else {
				obj.put("result", "success");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.getWriter().print(obj);
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> addProduct(MultipartFile upFile, HttpServletRequest req) throws IOException {
		System.out.println("파일 업로드 시작");
		String realPath = req.getSession().getServletContext().getRealPath("resources/uploads");
		System.out.println(realPath);
		
		String rename = new Upload().upFileReName(realPath, upFile.getOriginalFilename(), upFile.getBytes());
		
		return new ResponseEntity<String>(rename, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/addProduct", method =RequestMethod.POST )
	public void addProduct(Finished finished, Recipe recipe, HttpServletResponse resp) throws IOException {
		System.out.println(finished.toString());
		System.out.println(recipe.toString());
		int i = 0;
		try {
			i = service.addProduct(finished, recipe);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (i == 1) {
			resp.sendRedirect("/");
		}
	}
	@RequestMapping(value = "/forrecipe", method = RequestMethod.POST)
	public void forrecipe(Recipe recipe, HttpServletResponse resp) throws IOException {
		try {
			service.forrecipe(recipe);
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect("/");
	}
	
	@RequestMapping(value = "/tree", method =RequestMethod.POST )
	public void getTree(@RequestParam("rno")String rno, HttpServletResponse resp) throws IOException {
		JSONObject json = new JSONObject();
		try {
			List<Recipe> lst = service.getTree(rno);
			JSONArray arr = new JSONArray();
			for(Recipe r : lst) {
				JSONObject obj = new JSONObject();
				obj.put("id", r.getProductno());
				obj.put("parent", r.getParent());
				obj.put("text", r.getName());
				arr.add(obj);
				json.put("items", arr);
				obj = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.getWriter().print(json);
	}
	
	@RequestMapping("/selectedTree")
	public void selectedTree(@RequestParam("no")String no, HttpServletResponse resp) throws IOException {
		JSONObject json = new JSONObject();
		try {
			Product pr = service.selectedTree(no);
			json.put("result", "success");
			json.put("productno", pr.getProductno());
			json.put("stock", pr.getStock());
			json.put("name", pr.getName());
			json.put("img", pr.getImg());
			json.put("category", pr.getCategory());
		} catch (Exception e) {
			json.put("result", "fail");
			e.printStackTrace();
		}
		resp.getWriter().print(json);
	}
}
