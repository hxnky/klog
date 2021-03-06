   // 회원가입 버튼 눌렀을 때
        function click_regbtn() {
            // 원래 있던 버튼 숨기기
            $('.sel_login').css("display", "none");
            // 회원가입 관련 창 보여
            $(".login_inner").append("<button type='button' class='back_img' onclick='show_btn();'><img src='/resources/assets/img/left.png'></button><span class='pw_ck' onclick='FindPw();'>비밀번호를 잊으셨나요?</span><form id='regForm'><div class='new_reg'>이메일 <input type='email' name='email' class='new_ip' id='email' required oninput = 'checkEmail()'><span class='email_ck'>이메일 형식으로 입력해주세요</span><span class='email_ok'>사용 가능한 이메일입니다.</span>"
            +"<span class='email_already'>이미 가입된 이메일입니다.</span></div><div class='new_reg'>비밀번호 <input type='password' name='password' class='new_ip' id='password'></div><div class='new_reg'>닉네임 <input type='text' name='m_name' class='new_ip' id='m_name' required oninput = 'checkName()'><span class='name_ok'>사용 가능한 닉네임 입니다.</span><span class='name_already'>이미 있는 닉네임입니다.</span></div><button type='button' class='mem_reg' onclick='memberReg();'>가입하기</button></form>");
        }
        
    	// 로그인 버튼 눌렀을 때
        function click_eloginbtn() {
            // 원래 있던 버튼 숨기기
            $('.sel_login').css("display", "none");
            // 로그인 관련 창 보여
            $(".login_inner").append("<button type='button' class='back_img' onclick='show_btn();'><img src='/resources/assets/img/left.png'></button><span class='pw_ck' onclick='FindPw();'>비밀번호를 잊으셨나요?</span><form id='LoginForm'><div class='new_reg'>이메일 <input type='email' name='email' class='new_ip' id='email' required oninput = 'LoginPw()'><span class='email_ck'>이메일 형식으로 입력해주세요</span></div><div class='new_reg'>비밀번호 <input type='password' name='password' class='new_ip' id='password'></div><button type='button' class='mem_login' onclick='memberLogin();'>로그인</button></form>");
        }

     	// 원래 있던 버튼 다시 보여주기
        function show_btn() {            
            $("form").remove("#regForm");
            $("form").remove("#LoginForm");
            $("div").remove(".pw_send");
            $("button").remove(".back_img");
            $('.sel_login').css("display", "block");
            
        }
     	
     	// 회원가입 함수
     	function memberReg(){
     		console.log("가입버튼 클릭");

			var params = $('#regForm').serialize();
			var email = $("#email").val();

			$.ajax({
				url : '/user/reg',
				data : params,
				type : "POST",
				dataType : "json",
				async : false,
				success : function(result) {
						console.log(result);
						console.log("회원가입 성공");
						// 메인화면으로
						self.location = "/mainPage/"+email;

				},
				error : function(e) {
					// 전송 후 에러 발생 시 실행 코드
					console.log("ERROR : ", e);
				}
			}); // end ajax  
     	}
     	
     	// 이메일 중복체크 함수
     	function checkEmail(){
            var email = $('#email').val();
            
            // 유효성 검사
            var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 검증에 사용할 정규식 변수 regExp에 저장 
            
            // 이메일 형식일 경우에만 중복검사 진행
            if (email.match(regExp) != null) { 
            	console.log("이메일형식입니다.");
            	$('.email_ck').css("display", "none");
            	// 중복 검사
                $.ajax({
                    url:'/user/EmailCheck',
                    type:'post',
                    dataType : "json",
                    data:{email:email},
                    success:function(result){
                    	console.log(result);
                    	if(result != 1){
                            $('.email_ok').css("display","inline-block"); 
                            $('.email_already').css("display", "none");
                            $('.pw_ck').css("display","none");
                        } else {
                            $('.email_already').css("display","inline-block");
                            $('.pw_ck').css("display","inline-block");
                            $('.email_ok').css("display", "none");
                        }
                    },
                    error:function(){
                        alert("에러입니다");
                    }
                });
            } else{
            	$('.email_ck').css("display", "inline-block");
            	$('.email_ok').css("display", "none");
            	$('.email_already').css("display", "none");
            }
            
        };
        
     // 이름 중복체크 함수
     	function checkName(){
            var m_name = $('#m_name').val();
            $.ajax({
                url:'/user/NameCheck',
                type:'post',
                dataType : "json",
                data:{m_name:m_name},
                success:function(result){
                	console.log(result);
                	if(result != 1){
                        $('.name_ok').css("display","inline-block"); 
                        $('.name_already').css("display", "none");
                    } else if(result == 1) {
                        $('.name_already').css("display","inline-block");
                        $('.name_ok').css("display", "none");
                    }
                },
                error:function(){
                    alert("에러입니다");
                }
            });
        };
        
        // 비밀번호 찾기 함수
        function FindPw(){
        	
        	var email = $('#email').val();
        	console.log(email);
        	
        	// 해당 이메일로 비밀번호 찾기 or 바꿀 수 있는 메일 발송하는 ajax 추가하기
        	$.ajax({
				url : '/user/ChangePwMail',
				data : {"email":email},
				type : "POST",
				dataType : "json",
				async : false,
				success : function(result) {
						console.log(result);						
				},
				error : function(e) {
					// 전송 후 에러 발생 시 실행 코드
					console.log("ERROR : ", e);
				}
			}); // end ajax 
        	
        	$("form").remove("#regForm");
        	$("form").remove("#LoginForm");
        	$("span").remove(".pw_ck");
        	$(".login_inner").append("<div class='pw_send'>"+email+" <br>로 메일을 발송하였습니다.<br>이메일을 확인해주세요! </div>");
        	
        }
        
     	// 로그인 함수
     	function memberLogin(){
     		console.log("로그인버튼 클릭");

			var params = $('#LoginForm').serialize();
			var email = $("#email").val();

			$.ajax({
				url : '/user/login',
				data : params,
				type : "POST",
				dataType : "json",
				async : false,
				success : function(result) {
						console.log(result);
						if(result != 1){
							// 아이디나 비밀번호 확인
							alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
							// 비밀번호를 잊으셨나요 ?
							$('.pw_ck').css("display","inline-block");
						} else{
							// 메인화면으로
							self.location = "/mainPage/"+email;
							console.log("로그인 성공");
						}
						
				},
				error : function(e) {
					// 전송 후 에러 발생 시 실행 코드
					console.log("ERROR : ", e);
				}
			}); // end ajax  
     	}
     
     // 로그인 시 이메일 유효성 검사
     function LoginPw(){
    	 var email = $('#email').val();
         
         // 유효성 검사
         var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 검증에 사용할 정규식 변수 regExp에 저장 
         
         // 이메일 형식일 경우에만 중복검사 진행
         if (email.match(regExp) != null) { 
         	console.log("이메일형식입니다.");
         	$('.email_ck').css("display", "none");
         }else{
         	$('.email_ck').css("display", "inline-block");
        }
     }


        $(document).ready(function() {
            $("#e_reg").on("click", function(e) {
                click_regbtn();
            });
            
            $("#e_login").on("click", function(e) {
            	click_eloginbtn();
            });
            
        });