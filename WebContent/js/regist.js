function checkp(){
	if(user_password.value!=null){
		var cp=document.getElementById("registerConfirmPsw").value;
		var password=document.getElementById("user_password").value;
		if(cp!=""){

			if(cp!=password){
				ps2.style.display="";
				c3=0;
			}
			else{
				c3=1;
				ps2.style.display="none";		
			}
		}else{
			ps2.style.display="none";			
		}
	}
}
$('.password1').onblur(function(){
	var password=document.getElementById("password").value;
	var password1=document.getElementById("password1").value;
	if(password!=password1){
		alert("liangcimimabuyiyang ");
	}
})
$('.password').onblur(function() {
	var password=document.getElementById("password").value;
	if(password.length<8){
		alert("请输入8位以上的密码");
	}
})