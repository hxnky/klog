		
		var beforeColor; //이전에 선택된 컬러 저장 할 변수

        function init() {
            //2차원 배열 파레트 데이터
            var pallet = [
                ["#FF0000", "#FF5E00", "#FFBB00", "#FFE400", "#ABF200", "#1DDB16", "#00D8FF", "#0054FF", "#0100FF", "#5F00FF", "#FF00DD", "#FF007F", "#000000", "#FFFFFF"],
                ["#FFD8D8", "#FAE0D4", "#FAECC5", "#FAF4C0", "#E4F7BA", "#CEFBC9", "#D4F4FA", "#D9E5FF", "#DAD9FF", "#E8D9FF", "#FFD9FA", "#FFD9EC", "#F6F6F6", "#EAEAEA"],
                ["#FFA7A7", "#FFC19E", "#FFE08C", "#FAED7D", "#CEF279", "#B7F0B1", "#B2EBF4", "#B2CCFF", "#B5B2FF", "#D1B2FF", "#FFB2F5", "#FFB2D9", "#D5D5D5", "#BDBDBD"],
                ["#F15F5F", "#F29661", "#F2CB61", "#E5D85C", "#BCE55C", "#86E57F", "#5CD1E5", "#6799FF", "#6B66FF", "#A566FF", "#F361DC", "#F361A6", "#A6A6A6", "#8C8C8C"],
                ["#CC3D3D", "#CC723D", "#CCA63D", "#C4B73B", "#9FC93C", "#47C83E", "#3DB7CC", "#4374D9", "#4641D9", "#8041D9", "#D941C5", "#D9418C", "#747474", "#5D5D5D"],
                ["#980000", "#993800", "#997000", "#998A00", "#6B9900", "#2F9D27", "#008299", "#003399", "#050099", "#3F0099", "#990085", "#99004C", "#4C4C4C", "#353535"],
                ["#670000", "#662500", "#664B00", "#665C00", "#476600", "#22741C", "#005766", "#002266", "#030066", "#2A0066", "#660058", "#660033", "#212121", "#191919"]
            ];
            var tag = "";
            for (i = 0; i < pallet.length; i++) {
                for (j = 0; j < pallet[i].length; j++) {
                    tag += "<div id=" + pallet[i][j] + " class='colorBox' onclick='colorSet(this)'></div>";
                }
            }

            //파레트 파싱
            document.getElementById("palletBox").innerHTML = tag;

            //색상 입히기
            var colorBox = document.getElementsByClassName("colorBox");
            for (i = 0; i < colorBox.length; i++) {
                colorBox[i].style.background = colorBox[i].id;
            }
        }

        // onclick event
        function colorSet(target) {
            document.querySelector("nav").style.background = target.id;

            if (beforeColor != undefined && beforeColor != null) {
                document.getElementById(beforeColor).className = document.getElementById(beforeColor).className.replace(" active", "");
            }
            document.getElementById(target.id).className += " active";
            beforeColor = target.id;

            $(".bgcolor").remove();
            $(".container-color").append("<input type='hidden' name='bgcolor' class='bgcolor' value='" + beforeColor + "'>");

        }

	
	$(document).ready(function(){

			console.log("${social.insta}");
			var verify = "${userInfo.verify}";

			if ("${social.insta}" != "N") {
				$('#social_in').css("display", "inline-flex");
			} 
			if ("${social.git}" != "N") {
				$('#social_git').css("display", "inline-flex");
			} 
			
			if ("${social.twitter}" != "N") {
				$('#social_twi').css("display", "inline-flex");
			} 
			
			if ("${social.facebook}" != "N") {
				$('#social_fb').css("display", "inline-flex");
			}
			
			// 설정 버튼 클릭
            $("#nav_setting").on("click", function(e) {
                    // 원래 있던 버튼 숨기기
                    $(".container_none").hide();
                
                    // 비밀번호 일치해야 설정창으로 들어갈 수 있도록 하기
                
                
                
                    $(".container-setting").remove();
                    // 프로필 설정 관련 창 보여주기
                    // 사진, 닉네임, 바이오, 타이틀, 비밀번호 변경, sns 연결, nav 색  
                    // userInfo와 비교해서 수정된 내용 있는데 con_on 누를 경우 경고창 
                    $(".container-fluid").append("<div class='container-setting'><section class='resume-section'><div class='resume-section-content'><form class='User_setting'><div class='container_pic'><img class='propic' src='/resources/assets/img/profile.jpg'><span class='UserVerify'>미인증 회원입니다. 인증 후 설정 가능합니다.</span></div><div class='container-user'><div>닉네임 <input type='text' class='user_pro' name='m_name' value='${userInfo.m_name}'></div><div> 바이오 <input type='text' class='user_pro' name='bio' value='${userInfo.bio}'></div><div>타이틀<input type='text' class='user_pro' name='title' value='${userInfo.title}'></div><div>SNS 연결<div class='user_sns'><i class='fab fa-linkedin-in' id='icon_in'></i><i class='fab fa-github' id='icon_in'></i><i class='fab fa-twitter' id='icon_in'></i><i class='fab fa-facebook-f' id='icon_in'></i></div></div></div>" +
                        "<div class='container-color'>색상 변경<div id='palletBox' class='pallet'></div><div class='password_change'>비밀번호 변경</div><input type='password' name='password' class='pw_input' placeholder = '수정할 비밀번호를 입력하세요'><button class='profile_update'>수정하기</button><button class='profile_delete'>탈퇴하기</button></form></div></section></div>");

                    if ("${userInfo.verify}" == "N") { 
                        $('.UserVerify').css("display", "inline-block");

                        var input = document.getElementsByClassName("user_pro");
                        input.setAttribute("readonly", "readonly");

                    }
                

                // 팔레트 추가
                init();


            });

        $(".con_on").on("click", function(e) {
            // 원래 있던 버튼 숨기기
            $(".container-setting").hide();
            $(".container_none").show();

        });


		});