package org.crama.burrhamilton.service;

import org.crama.burrhamilton.form.SignUpForm;
import org.crama.burrhamilton.model.SocialUser;
import org.crama.burrhamilton.model.UserDetailsImpl;
import org.crama.burrhamilton.model.UserRole;
import org.crama.burrhamilton.repository.UserRepository;
import org.crama.burrhamilton.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.social.connect.Connection;
import org.springframework.social.security.SocialUserDetails;
import org.springframework.social.security.SocialUserDetailsService;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService, UserDetailsService, SocialUserDetailsService {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public SocialUserDetails loadUserByUsername(String uniqueKey) throws UsernameNotFoundException {
		SocialUser user = userRepository.findByUniqueKey(uniqueKey);
		if (user == null)
			throw new UsernameNotFoundException(uniqueKey);

		return new UserDetailsImpl(user);
	}

	@Override
	public SocialUserDetails loadUserByUserId(String providerUserId) throws UsernameNotFoundException {
		return loadUserByUsername(providerUserId);
	}

	@Override
	public SocialUser signup(SignUpForm signupForm, Connection<?> connection) {
		
		if (connection != null) {
            
            final SocialUser user = new SocialUser();
            
    		user.setUsername(signupForm.getUsername());
    		user.setRole(UserRole.ROLE_USER);
    		user.setQualification(signupForm.getQualification());
    		user.setImageUrl(connection.getImageUrl());
    		user.setUniqueKey(connection.getKey().getProviderId() + connection.getKey().getProviderUserId());
    		user.setPassword(passwordEncoder.encode(Util.getSaltString(10)));
    		
    		userRepository.save(user);
    		
            this.loginUser(user);
            
    		return user;
		}
		else {
			System.out.println("Connection is null");
			return null;
		}
		
		
	}
	@Override
	public void loginUser(SocialUser user) {
		
		UserDetailsImpl userDetails = new UserDetailsImpl(user);
		 
        Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);
		
	}

	@Override
	public SocialUser findByUniqueKey(String uniqueKey) {
		return userRepository.findByUniqueKey(uniqueKey);
	}

	@Override
	public SocialUser getPrincipal() {
		Authentication authentication = 
				SecurityContextHolder.getContext().getAuthentication();
		if ((authentication == null) || (!authentication.isAuthenticated())) {
		  
			return null;
		}
		System.out.println(authentication.getPrincipal());
		
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		SocialUser loginUser = findByUniqueKey(userDetails.getUsername());
		return loginUser;
	  
	}
	
}
