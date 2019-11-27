$(document).ready(function(){
	//读取分类列表，生成导航标签
	getBadgePill();
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


function getBadgePill(){
	$.ajax({
		url:'/getCategory',
		type:'GET',
		success:function(data){
			var classArr=["badge-dark","badge-info"];
			var str='';
			for(var i=0;i<data.article_categories.length;i++){
				str+='<a href="#"><span  class="badge  badge-pill '+classArr[i]+'">'+data.article_categories[i].category_name+'</span></a>&nbsp;';
			}
			//Math.round(Math.random())
			$('.badge_nav').empty();
			
			$('.badge_nav').append(str);
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

function getCurrentPage(currentPage){
	$.ajax({
		url:'/getPageData',
		type:'POST',
		dataType:'json',
		contentType:'application/json;charset=utf-8',
		data:JSON.stringify({"currentPage":currentPage}),
		success:function(data){
			console.log(data.onPageList);
			//往contaniner里铺数据
			var str="";
			for(var i=0;i<data.onPageList.length;i++){
				var content=data.onPageList[i].editor_data.substring(0,100);
				str+='<li class="list-group-item">'+
						'<h3><a href="#">'+data.onPageList[i].article_title+'</a></h3>'+
						'<p>'+data.onPageList[i].article_date+'</p>'+
						'<div>'+content+'</div>'+
					'</li>';
			}
			
			$('#page_list').empty();
			$('#page_list').append(str);
						
		}
	});
}