package org.crama.burrhamilton.service;

import org.crama.burrhamilton.form.SignUpForm;
import org.crama.burrhamilton.model.SocialUser;
import org.springframework.social.connect.Connection;

public interface UserService {

	SocialUser signup(SignUpForm signupForm, Connection<?> connection);

	void loginUser(SocialUser user);

	SocialUser findByUniqueKey(String uniqueKey);

	SocialUser getPrincipal();

}
