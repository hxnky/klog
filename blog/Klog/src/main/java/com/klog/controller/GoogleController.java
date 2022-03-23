package com.klog.controller;

import java.net.URI;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.klog.domain.MemberVO;
import com.klog.mapper.MemberMapper;

@Controller
public class GoogleController {
	@Value("#{config['google.auth.url']}")
	private String googleAuthUrl;

	@Value("#{config['google.login.url']}")
	private String googleLoginUrl;

	@Value("#{config['google.redirect.url']}")
	private String googleRedirectUrl;

	@Value("#{config['google.client.id']}")
	private String googleClientId;

	@Value("#{config['google.secret']}")
	private String googleClientSecret;

	@Autowired
	private MemberMapper mapper;

	// 구글 로그인창 호출
	@RequestMapping(value = "/login/getGoogleAuthUrl")
	public @ResponseBody String getGoogleAuthUrl(HttpServletRequest request) throws Exception {

		String reqUrl = googleLoginUrl + "/o/oauth2/v2/auth?client_id=" + googleClientId + "&redirect_uri="
				+ googleRedirectUrl + "&response_type=code&scope=email%20profile&access_type=offline";

		return reqUrl;
	}

	// 구글 연동정보 조회
	@RequestMapping(value = "/auth/google/callback")
	public String oauth_google(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		System.out.println("들어옴");
		String code = request.getParameter("code");
		HttpHeaders headers = new HttpHeaders();
		RestTemplate restTemplate = new RestTemplate();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("code", code);
		parameters.add("client_id", googleClientId);
		parameters.add("client_secret", googleClientSecret);
		parameters.add("redirect_uri", googleRedirectUrl);
		parameters.add("grant_type", "authorization_code");

		HttpEntity<MultiValueMap<String, String>> rest_request = new HttpEntity<>(parameters, headers);

		URI uri = URI.create("https://www.googleapis.com/oauth2/v4/token");

		ResponseEntity<JSONObject> rest_reponse;
		rest_reponse = restTemplate.postForEntity(uri, rest_request, JSONObject.class);
		JSONObject bodys = rest_reponse.getBody();
		System.out.println(bodys);

		String jwtToken = bodys.get("id_token").toString();
		System.out.println(jwtToken);
		// id_token은 jwt 형식

		// String jwtToken = bodys.getString("id_token");
		String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo")
				.queryParam("id_token", jwtToken).toUriString();
		System.out.println(requestUrl);
		JSONObject resultJson = restTemplate.getForObject(requestUrl, JSONObject.class);
		System.out.println(resultJson);
		// 구글 정보조회 성공
		String email = "";
		String m_pic = "";
		String m_name = "";
		if (resultJson != null) {

			// 구글 회원 이메일
			email = resultJson.get("email").toString();
			m_pic = resultJson.get("picture").toString();
			m_name = resultJson.get("given_name").toString();

			MemberVO member = new MemberVO();

			member.setEmail(email);
			member.setM_pic(m_pic);
			member.setM_name(m_name);
			member.setLoginType("google");
			member.setVerify("Y");

			if (mapper.EmailCheck(email) == 1) {

				MemberVO check = new MemberVO();

				check = mapper.userInfo(email);

				if (check.getLoginType() == "email") {
					model.addAttribute("socialResult", "1");
				} else {
					model.addAttribute("socialResult", "2");
					model.addAttribute("email", email);
				}

			} else {
				mapper.SocialRegister(member);
				member = mapper.userInfo(email);
				mapper.regSns(member.getM_idx());
				model.addAttribute("socialResult", "0");
				model.addAttribute("email", email);
			}

			// 구글 정보조회 실패
		} else {
			throw new Exception("구글 정보조회에 실패했습니다.");
		}

		return "/member/social";
	}
}
