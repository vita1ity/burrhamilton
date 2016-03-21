package org.crama.burrhamilton.controller;

import org.crama.burrhamilton.model.SocialUser;
import org.crama.burrhamilton.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SignInController {
	
	@Autowired
	private ProviderSignInUtils providerSignInUtils;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/signin", method = RequestMethod.GET) 
	public String signinPage(WebRequest request) {
		
		
		return "signin";
	}
	@RequestMapping(value = "/signin", method = RequestMethod.POST) 
	public String signin(WebRequest request, RedirectAttributes redirectAttributes) {
		
		Connection<?> connection = providerSignInUtils.getConnectionFromSession(request);
		SocialUser user = userService.findByUniqueKey(connection.getKey().getProviderId() + connection.getKey().getProviderUserId());
		userService.loginUser(user);
		
		return "redirect:/";
	}
}	
