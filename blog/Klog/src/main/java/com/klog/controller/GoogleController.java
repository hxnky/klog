package com.klog.controller;

import java.net.URI;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

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

	// 구글 로그인창 호출
	@RequestMapping(value = "/login/getGoogleAuthUrl")
	public @ResponseBody String getGoogleAuthUrl(HttpServletRequest request) throws Exception {

		String reqUrl = googleLoginUrl + "/o/oauth2/v2/auth?client_id=" + googleClientId + "&redirect_uri="
				+ googleRedirectUrl + "&response_type=code&scope=email%20profile&access_type=offline";

		return reqUrl;
	}

	// 구글 연동정보 조회
	@RequestMapping(value = "/auth/google/callback")
	public String oauth_google(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		String requestUrl = UriComponentsBuilder.fromHttpUrl(googleAuthUrl + "/tokeninfo").queryParam("id_token", jwtToken).toUriString();
		System.out.println(requestUrl);
		JSONObject resultJson = restTemplate.getForObject(requestUrl, JSONObject.class);

		// 구글 정보조회 성공
		if (resultJson != null) {

			// 회원 고유 식별자
			// String googleUniqueNo = resultJson.getString("sub");
			System.out.println(resultJson);
			/**
			 * 
			 * TO DO : 리턴받은 googleUniqueNo 해당하는 회원정보 조회 후 로그인 처리 후 메인으로 이동
			 * 
			 */

			// 구글 정보조회 실패
		} else {
			// throw new ErrorMessage("구글 정보조회에 실패했습니다.");
		}
		return "";
	}
}
