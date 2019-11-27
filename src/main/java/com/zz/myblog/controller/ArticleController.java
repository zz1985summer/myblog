package com.zz.myblog.controller;

import java.io.File;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zz.myblog.domain.ArticleData;
import com.zz.myblog.domain.Category;
import com.zz.myblog.service.ArticleService;


@Controller
public class ArticleController {
	// 图片类型
    private static List<String> fileTypes = new ArrayList<String>();

    static {
        fileTypes.add(".jpg");
        fileTypes.add(".jpeg");
        fileTypes.add(".bmp");
        fileTypes.add(".gif");
        fileTypes.add(".png");
    }
	
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("/getCategory")
	@ResponseBody
	public Map<String,Object> getArticleCategory() {
		Map<String,Object> resMap = new HashMap<String,Object>();
		
		List<Category> categories = articleService.getCategories();
		resMap.put("article_categories", categories);
		
		return resMap;
	}
	
	@RequestMapping("/uploadImage")
	public void uploadImage(Principal principal,HttpServletResponse response,HttpServletRequest request,@RequestParam("upload") MultipartFile file) throws Exception {
		ObjectMapper om = new ObjectMapper();		
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		String fileName="";
		
		if(multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator<String> it = multiRequest.getFileNames();
			while(it.hasNext()) {
				int pre = (int)System.currentTimeMillis();
				MultipartFile ifile = multiRequest.getFile(it.next());
				if(ifile!=null) {
					String myfileName = file.getOriginalFilename();
					if(myfileName.trim()!="") {
						String originalFilename = ifile.getOriginalFilename();
						String suffix = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
						
						if (!fileTypes.contains(suffix)) {
                            continue;
                        }
						 // 获得上传路径的绝对路径地址(/upload)-->
						//System.out.println("路径:"+request.getSession().getServletContext().getRealPath("/"));
                        //String realPath = request.getSession().getServletContext().getRealPath("/upload/");
						String realPath = "D:"+File.separator+"upload";
                        
                        // 如果路径不存在，则创建该路径
                        File realPathDirectory = new File(realPath);
                        if (realPathDirectory == null || !realPathDirectory.exists()) {
                            realPathDirectory.mkdirs();
                        }
                        // 重命名上传后的文件名 111112323.jpg
                        fileName =UUID.randomUUID()+myfileName.substring(myfileName.lastIndexOf('.'));
                        // 定义上传路径 .../upload/111112323.jpg
                        File uploadFile = new File(realPathDirectory + "\\" + fileName);
                       
                        file.transferTo(uploadFile);                        
					}
				}
				
			}			
		}
		
		//Resource resource = new ClassPathResource("");
		//System.out.println("spring项目路径："+resource.getFile().getAbsolutePath()+" and "+resource.getFile().getPath());		
		String imageContextPath =request.getContextPath()+"/upload"+"/"+fileName;
		
		Map<String,Object> resultMap= new HashMap<String,Object>();
	    resultMap.put("uploaded",1);
	    resultMap.put("fileName",fileName);
	    resultMap.put("url",imageContextPath);
	    String jsonStr=om.writeValueAsString(resultMap);
	    PrintWriter out = response.getWriter();
	    out.println(jsonStr);
	    out.flush();
	    out.close();		
	}
	
	@RequestMapping("/browser")
	public String fileBrowser(Model model,HttpServletRequest request,String type,String CKEditor,String CKEditorFuncNum) throws JsonProcessingException {
		
		String imagePath=request.getContextPath()+"/upload";
				
		File files = new File(imagePath);
		File[] fList=files.listFiles();
		
		for(File i:fList) {
			System.out.println(i.getName()+i.getAbsolutePath()+i.lastModified()+i.getPath());
			
		}		
		//System.out.println(request.getRequestURL().substring(0,(request.getRequestURL().lastIndexOf("/"))));
		
		//String addr=request.getRequestURL().substring(0,(request.getRequestURL().lastIndexOf("/")));
				
		@SuppressWarnings("rawtypes")
		List<Map> results = new ArrayList<Map>();
		for(int i=0;i<fList.length;i++) {
			if(!fList[i].isDirectory()) {
				Map<String,Object> imgInfo = new HashMap<String,Object>();
				imgInfo.put("name", fList[i].getName());
				String tmp=fList[i].getPath().replaceAll("\\\\", "/");
				imgInfo.put("url", tmp);
				imgInfo.put("mtime", fList[i].lastModified());
				results.add(imgInfo);
			}
		}
				
		model.addAttribute("results",results).addAttribute("callback", CKEditorFuncNum);
		
		return "img_mgr";
	}
	
	@GetMapping("/adminSelectImg/{img_url}/{callback}")
	@ResponseBody
	public String adminSelectImg(@PathVariable("img_url") String img_url,@PathVariable("callback") String callback) {
		System.out.println("img_url="+img_url+",callback="+callback);
		
		String str = "<script type=\"text/javascript\">" + "window.opener.CKEDITOR.tools.callFunction("+ callback + ",'" + "/upload/"+ img_url + "','');window.close();" + "</script>";
		
		return str;
	}
	
	@RequestMapping("/saveArticleData")
	@ResponseBody
	public Map<String,Object> saveArticeData(@RequestBody ArticleData article_data) {
		Map<String,Object> m = new HashMap<String,Object>();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		article_data.setArticle_date(df.format(new Date()));
		//System.out.println(article_data.getArticle_date()+" "+article_data.getUid()+"  "+article_data.getArticle_title()+" "+article_data.getEditor_data()+" "+article_data.getArticle_cat());
		String msg=articleService.saveArticle(article_data);
		m.put("msg", msg);
		
		return m;
	}
	
	@RequestMapping("/getListCount")
	@ResponseBody
	public Map<String,Object> getListCount() {
		Map<String,Object> resMap = new HashMap<String,Object>();
		
		int count= articleService.getListCount();
		resMap.put("count", count);
		
		return resMap;
	}
	
	@RequestMapping("/getPageData")
	@ResponseBody
	public Map<String,Object> getPageData(@RequestBody Map<String,Integer> map){
		//System.out.println(map.get("currentPage"));
		long st=System.currentTimeMillis();
		
		int start_id = (map.get("currentPage")-1)*5;
		List<ArticleData> onePageDataList=articleService.getPageData(start_id);
		
		long ed=System.currentTimeMillis();
		
		System.out.println("ed-st="+(ed-st)/1000);
		
		Map<String,Object> onePage = new HashMap<String,Object>();
		onePage.put("onPageList", onePageDataList);
		
		return onePage;
	}
}
