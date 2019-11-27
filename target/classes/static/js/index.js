$(document).ready(function(){
	//文档一就绪，先去查询日志列表更新到页面
	getArticlesList();
	
	//给翻页添加效果
	$('#idx_pagination').on('click','li',function(e){
		//console.log(e);
		if(e.target.classList.contains('disabled')){
			e.preventDefault();
			return;
		}else{
			
			//只有一页时前后都禁用
			if(e.delegateTarget.children.length===3){
				e.delegateTarget.children[0].classList.add('disabled');
				e.delegateTarget.children[2].classList.add('disabled');
				return;
			}
			
			//点击上一页和下一页时，找被激活的li，然后把它的激活类改一下
			if(e.target.firstChild.nodeValue==="Previous"){
				e.delegateTarget.children[e.delegateTarget.children.length-1].classList.contains('disabled')?e.delegateTarget.children[e.delegateTarget.children.length-1].classList.remove('disabled'):"";
				for(var i=0;i<e.delegateTarget.children.length;i++){
					if(e.delegateTarget.children[i].classList.contains('active')){
						e.delegateTarget.children[i].classList.remove('active');
						e.delegateTarget.children[i-1].classList.add('active');
						//拉取页面数据
						getCurrentPage(e.delegateTarget.children[i-1].children[0].innerText);
						if(i===2){
							e.delegateTarget.children[0].classList.add('disabled');
						}
						
						break;
					}
				}
			}else if(e.target.firstChild.nodeValue==="Next"){
				e.delegateTarget.children[0].classList.contains('disabled')?e.delegateTarget.children[0].classList.remove('disabled'):"";
				for(var i=0;i<e.delegateTarget.children.length;i++){
					if(e.delegateTarget.children[i].classList.contains('active')){
						e.delegateTarget.children[i].classList.remove('active');
						e.delegateTarget.children[i+1].classList.add('active');
						//拉取页面数据
						getCurrentPage(e.delegateTarget.children[i+1].children[0].innerText);
						//next 到最后一页时禁止next
						if(e.delegateTarget.children.length-2===i+1){
							e.delegateTarget.children[i+2].classList.add('disabled');
						}
						
						break;
					}
				}
			}else{
				e.delegateTarget.children[0].classList.contains('disabled')?e.delegateTarget.children[0].classList.remove('disabled'):"";
				e.delegateTarget.children[e.delegateTarget.children.length-1].classList.contains('disabled')?e.delegateTarget.children[e.delegateTarget.children.length-1].classList.remove('disabled'):"";
				
				e.delegateTarget.children[1]===e.target.parentElement?e.delegateTarget.children[0].classList.add('disabled'):e.delegateTarget.children[0].classList.remove('disabled');
				e.delegateTarget.children[e.delegateTarget.children.length-2]===e.target.parentElement?e.delegateTarget.children[e.delegateTarget.children.length-1].classList.add('disabled'):e.delegateTarget.children[e.delegateTarget.children.length-1].classList.remove('disabled');
				
				
				
				
				for(var i=0;i<e.delegateTarget.children.length;i++){
					if(e.delegateTarget.children[i].classList.contains('active')){
						e.delegateTarget.children[i].classList.remove('active');
					}
				}
				e.target.parentElement.classList.add('active');
				//拉取页面数据
				getCurrentPage(e.target.innerText);	
			}
			
					
		}
		
	})
});


function getCurrentPage(currentPage){
	$.ajax({
		url:'/getPageData',
		type:'POST',
		dataType:'json',
		contentType:'application/json;charset=utf-8',
		data:JSON.stringify({"currentPage":currentPage}),
		success:function(data){
			console.log(data.onPageList);
			$('#article_table tbody').empty();
			for(var i=0;i<data.onPageList.length;i++){
				var str='<tr><th>'+(i+1)+'</th>';
				str+='<td><a href="#">'+data.onPageList[i].article_title+'</a></td>'+
					'<td>'+$('#u_id')[0].placeholder+'</td>'+
					'<td>'+data.onPageList[i].article_cat+'</td>'+
					'<td>'+data.onPageList[i].article_date+'</td>'+
					'<td><a href="#">删除</a></td>';
				$('#article_table tbody').append(str);
				
				
				//给a元素绑定一下事件
				/*var obj=data.onPageList[i];
				
				$('#article_table tbody')[0].children[i].children[1].firstChild.onclick=function(e){
					getCategory();
					$('#article_title').html('');
					$('#article_title').val(e.target.innerHTML);
					$("#article_cat").find("option[text="+obj.article_cat+"]").attr("selected",true);
					CKEDITOR.instances.editor1.setData(obj.editor_data);
					$('.bd-example-modal-xl').modal({
						show:true
					});
					
				}*/
			}
			
		}
	})
}


function getArticlesList(){
	$.ajax({
		url:'/getListCount',
		type:'GET',
		sync:true,
		success:function(data){
			var pageCount=data.count%5===0?data.count/5:parseInt(data.count/5)+1;
			
			var str='<li class="page-item"><span class="page-link">Previous</span></li>';
			for(var i=1;i<=pageCount;i++){
				str+='<li class="page-item"><a class="page-link" href="#">'+i+'</a></li>';
			}
			
			str+='<li class="page-item"><a class="page-link" href="#">Next</a></li>';
			
			$('#idx_pagination').empty();
			$('#idx_pagination').append(str);
			//先给第一页加激活class以及拉取数据
			$('#idx_pagination')[0].children[1].classList.add("active");
			$('#idx_pagination')[0].children[0].classList.add("disabled");
			getCurrentPage($('#idx_pagination')[0].children[1].innerText);
		}
	});
}

function getArticleData(){
	var editor_data = CKEDITOR.instances.editor1.getData();
	
	var article_title = $('#article_title').val();
	
	var article_cat = $('#article_cat').val();
	
	var uid;
	if($('#u_id').val()!==null && $('#u_id').val()!==""){
		uid=$('#u_id').val().trim();
	}else{
		$('#info_model .modal-body').empty();
		$('#info_model .modal-body').append("<div style='text-align:center;min-height:50px;'>获取不到用户id，请确认是否登陆！</div>");
		$('#info_model').modal({
			show:true
		});
		return;
	}
	
	if(article_cat == 0){
		article_cat="工作学习";
	}
	
	if(article_title==="" || article_title.trim()===""){		
		$('#info_model .modal-body').empty();
		$('#info_model .modal-body').append("<div style='text-align:center;min-height:50px;'>文章标题为空！</div>");
		$('#info_model').modal({
			show:true
		});
		return;
	}
	
	if(editor_data==="" || editor_data.trim()===""){
		$('#info_model .modal-body').empty();
		$('#info_model .modal-body').append("<div style='text-align:center;min-height:50px;'>文章内容为空！</div>");
		$('#info_model').modal({
			show:true
		});
		return;
	}
		
	
	
	var article_data={"uid":uid,"article_title":article_title,"editor_data":editor_data,"article_cat":article_cat};
	
	
	$.ajax({
		url:'/saveArticleData',
		type:'POST',
		contentType: "application/json;charset=utf-8",
		dataType: "json",
		data:JSON.stringify(article_data),
		success:function(data){
			
			$('#info_model .modal-body').empty();
			$('#info_model .modal-body').append("<div style='text-align:center;min-height:50px;'>"+data.msg+"</div>");
			$('#info_model').modal({
				show:true
			});
			//SELECT * FROM product WHERE ID > =(select id from product limit 866613, 1) limit 20
			//更新文章列表
			getCurrentPage(1);
		}
		
	});
}

function getCategory(){
	//取文章分类
	$.ajax({
		url:'/getCategory',
		async:false,
		type:'GET',
		success:function(data){
			var cate=data.article_categories;
			var str="";
			for(var i=0;i<cate.length;i++){
				str+="<option value="+cate[i].category_name+">"+cate[i].category_name+"</option>";
			}
			
			$("#article_cat").append(str);
		}
	})
}