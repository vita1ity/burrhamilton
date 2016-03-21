package org.crama.burrhamilton.controller;

import javax.validation.Valid;

import org.crama.burrhamilton.form.SignUpForm;
import org.crama.burrhamilton.model.SocialUser;
import org.crama.burrhamilton.service.UserService;
import org.crama.burrhamilton.util.Util;
import org.crama.burrhamilton.validator.SignUpFormValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SignUpController {
	
	@Autowired
	private SignUpFormValidator signupFormValidator;
	@Autowired
	private UserService userService;
	@Autowired
	private ProviderSignInUtils providerSignInUtils;
	
	@InitBinder("signupForm")
	protected void initSignupBinder(WebDataBinder binder) {
		binder.setValidator(signupFormValidator);
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Model model, WebRequest request) {
		
		System.out.println("Signup Contoller - GET");
		
        Connection<?> connection = providerSignInUtils.getConnectionFromSession(request);
		model.addAttribute("signupForm", SignUpForm.fromConnection(connection));
		return "signup";
		
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(@ModelAttribute("signupForm") @Valid SignUpForm signupForm,
			BindingResult result, WebRequest request, RedirectAttributes redirectAttributes, Model model) {
		
		if (result.hasErrors()) {
			model.addAttribute("signupForm", signupForm);
			return "signup";
		}

		Connection<?> connection = providerSignInUtils.getConnectionFromSession(request);
		SocialUser user = userService.signup(signupForm, connection);
		providerSignInUtils.doPostSignUp(user.getUniqueKey(), request);
		

		Util.flash(redirectAttributes, "success", "signupSuccess");
		
		return "redirect:/";

	}
	
	 
	
}
