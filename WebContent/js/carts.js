
$(function () {

//===============================选择框按钮部分开始================================
//全选与单选以及数额、商品的关系

        //全局的全部checkbox
    var $allCheckbox = $('input[type="checkbox"]'),     
        $wholeChexbox = $('.whole_check'),
        $cartBox = $('.cartBox'),
        //每个商品的checkbox                      
        $sonCheckBox = $('.son_check');                 
    

    //全选与单个商品的关系
    $wholeChexbox.click(function () {
        var $checkboxs = $cartBox.find('input[type="checkbox"]');
        if ($(this).is(':checked')) {
            $checkboxs.prop("checked", true);
        } else {
            $checkboxs.prop("checked", false);
        }
        totalMoney();
    });

    //单选与单个商品的关系
    $sonCheckBox.each(function () {
        $(this).click(function () {
            if ($(this).is(':checked')) {
                //判断：所有单个商品是否勾选
                var len = $sonCheckBox.length;
                var num = 0;
                $sonCheckBox.each(function(){
                    if ($(this).is(':checked')){num++;}
                });
                if (num == len) {
                    $wholeChexbox.prop("checked", true);
                    }
                }else{
                $wholeChexbox.prop("checked", false);
            }
        });
    });

    
    //全选与单选的关系
        //$sonChecks有一个未选中，全选按钮取消选中，若全都选中，则全选打对勾
        //可分店铺
    $cartBox.each(function(){
        var $this = $(this);
        var $sonChecks = $this.find('.son_check');
        $sonChecks.each(function(){
            $(this).click(function(){
                if ($(this).is(':checked')){
                    var len = $sonChecks.length;
                    var num = 0;
                    $sonChecks.each(function(){
                        if ($(this).is(':checked')){num++;}
                    });
                    if(num == len){
                        $(this).parents().find('.whole_check').prop("checked", true);}
                }else{
                    $(this).parents().find('.whole_check').prop("checked", false);
                }
                totalMoney();
            });
        });
    });
//===============================选择框按钮部分结束================================
//===========================================================================
    



//=============================商品的数量和价格的关系==============================
//主要用到jquery的各种遍历
    var $plus = $('.plus'),
        $reduce = $('.reduce'),
        $all_sum = $('.sum');

//点击加号
        $plus.click(function () {
        	//alert($(this).prev('input').val())
            //定义$inputVal获取到加号前面的input元素
            var $inputVal = $(this).prev('input'),
            //parseFloat解析一个字符串并返回整数
            //val()返回或设置被选中元素的属性
            //这是点击加号要执行的操作，
            //所以找到了input标签中的数量并+1返回，同时赋值给了$count
            
            $count = parseFloat($inputVal.val())+1,
            //加号 向上遍历其父元素amount_box并找到父元素的子元素“reduce”
            $obj = $(this).parents('.amount_box').find('.reduce'),
            //同样的方法向上遍历祖先元素并找到其子元素“小计”
            $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
            //找到单价
            $price = $(this).parents('.order_lists').find('.price').html(),
            //总价=数量*单价；substring用于提取字符
            $priceTotal = $count*parseFloat($price);
            $inputVal.val($count);
            
            $priceTotalObj.html('￥'+$priceTotal);
            //显示减号的样式，如果大于1则自动更改样式,等于1时鼠标划过样式不变
                if($inputVal.val()>1 && $obj.hasClass('reduce')){
                    $obj.removeClass('reduce');
                }
        //计算总价
        totalMoney();
    });


//点击减号,和加号同理
        $reduce.click(function () {
            var $inputVal = $(this).next('input'),
                $count = parseFloat($inputVal.val())-1,
                $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
                $price = $(this).parents('.order_lists').find('.price').html(),  //单价
                $priceTotal = $count*parseFloat($price);
            if($inputVal.val()>1){
                $inputVal.val($count);
                $priceTotalObj.html('￥'+$priceTotal);
            }
            if($inputVal.val()==1 && !$(this).hasClass('reduce')){
                $(this).addClass('reduce');
            }
        totalMoney();
    });

//keyup()按键松开时触发的函数
        $all_sum.keyup(function () {
            var $count = 0,
                $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
                $price = $(this).parents('.order_lists').find('.price').html(),  //单价
                $priceTotal = 0;
            if($(this).val()==''){
                $(this).val('1');
            }
            //匹配非数字字符或者是以0开头的字符
            $(this).val($(this).val().replace(/\D|^0/g,''));
            $count = $(this).val();
            //按键被松开时小计中的数额同时发生改变
            $priceTotal = $count*parseFloat($price);
            $(this).attr('value',$count);
            $priceTotalObj.html('￥'+$priceTotal);
        totalMoney();
    });
//===========================商品的数量和价格的关系结束============================
//=========================================================================




      //=================================删除商品=================================
        var $order_lists = null;
        var $order_content = '';
       //var $pId='';
    $('.delBtn').click(function(){	
        $order_lists = $(this).parents('.order_lists');
        $order_content = $order_lists.parents('.order_content');
       	var pId=$(this).parents('.order_lists').attr('id'); 
		//alert(pId);
		var ssss="ShoppingCartServlet?action=deleteCart&productsId=";
		//alert(ssss)
		var aaaa=ssss+pId;
		//alert(aaaa);
		$('.dialog-sure').attr('href',aaaa); 		
        $('.model_bg').fadeIn(300);
        $('.my_model').fadeIn(300);
        //fadeIn淡入效果实现打开模态框 响应速度300ms
});

//关闭模态框
    $('.closeModel').click(function(){
        closeM();
    });
    $('.dialog-close').click(function(){
        closeM();
    });

function closeM() {
    $('.model_bg').fadeOut(300);
    $('.my_model').fadeOut(300);
    //fadeOut淡出效果实现关闭模态框 响应速度300ms
}

//确定按钮，移除商品
$('.dialog-sure').click(function () {
	//var a=$(this).attr('href');
	//alert(a)
    $order_lists.remove();
    //trim删除字符串两端的空白字符
    if($order_content.html().trim() == null || $order_content.html().trim().length == 0){
        $order_content.parents('.cartBox').remove();
    }
    closeM();
    $sonCheckBox = $('.son_check');
    totalMoney();
})

//=========================删除商品结束============================
//=================================================================




//==========================计算总额============================
    function totalMoney(){
        var total_money = 0;
        var total_count = 0;
        //calBtn中的a超链接
        var calBtn = $('.submit_btn');
        $sonCheckBox.each(function () {
            if ($(this).is(':checked')) {
            	
            	var a=parseFloat($(this).parents('.order_lists').find('.price').html());
                
            	//var goods = parseFloat($(this).parents('.order_lists').find('.sum_price').html().substring(1));
                var num =  parseFloat($(this).parents('.order_lists').find('.sum').val());
                //total_money += goods;
                total_money+=a*num;
                total_count += num;
            }
        });
        $('.total_text').html('￥'+total_money);
        $('.piece_num').html(total_count);

        // console.log(total_money,total_count);
        //如果监听到数量和小计不为0则给结算按钮增加一个样式
        if(total_money!=0 && total_count!=0){
            if(!calBtn.hasClass('btn_sty')){
                calBtn.addClass('btn_sty');
            }
        }else{
            if(calBtn.hasClass('btn_sty')){
                calBtn.removeClass('btn_sty');
            }
        }
    }

});