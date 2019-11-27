package com.zz.myblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zz.myblog.dao.ArticleMapper;
import com.zz.myblog.domain.ArticleData;
import com.zz.myblog.domain.Category;

@Component
public class ArticleService {
	@Autowired
	private ArticleMapper articleMapper;
	
	public List<Category> getCategories(){
		return articleMapper.getCategories();
	}

	public String saveArticle(ArticleData article_data) {
		int i=articleMapper.saveArticle(article_data);
		if(i>0) {
			return "文章保存成功!";
		}else {
			return "文章保存失败!";
		}
		
	}
	
	public int getListCount() {
		int i=articleMapper.getArticlesCount();
		return i;
	}
	
	public List<ArticleData> getPageData(int start_id) {
		
		return articleMapper.getArticles(start_id);
	}
	
	
}
