package com.zz.myblog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.zz.myblog.domain.ArticleData;
import com.zz.myblog.domain.Category;

public interface ArticleMapper {
	@Select("SELECT * FROM blog_category")
	List<Category> getCategories();
	
	@Insert("INSERT INTO blog_articles (uid,article_title,article_content,article_date,article_category) VALUES (#{uid},#{article_title},#{editor_data},#{article_date},#{article_cat})")
	int saveArticle(ArticleData article_data);
	
	@Select("SELECT COUNT(article_id) FROM blog_articles")
	int getArticlesCount();
	
	@Select("SELECT * FROM blog_articles WHERE article_id >= (SELECT article_id FROM blog_articles LIMIT #{start_id}, 1) LIMIT 5")
	@Results({
		@Result(property="editor_data",column="article_content"),
		@Result(property="article_cat",column="article_category")
	})
	List<ArticleData> getArticles(@Param("start_id") int start_id);

}
