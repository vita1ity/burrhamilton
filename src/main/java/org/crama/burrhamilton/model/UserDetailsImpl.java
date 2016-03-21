package org.crama.burrhamilton.model;

import java.util.Collection;
import java.util.HashSet;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.social.security.SocialUserDetails;


public class UserDetailsImpl implements SocialUserDetails {

	private static final long serialVersionUID = -2113129555597445509L;
	
	private SocialUser user;
	
	public UserDetailsImpl(SocialUser user) {
		this.user = user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<GrantedAuthority> authorities = new HashSet<GrantedAuthority>(1);
		System.out.println(user.getRole().toString());
		authorities.add(new SimpleGrantedAuthority(user.getRole().toString()));

		return authorities;
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		
		return user.getUniqueKey();
	}

	@Override
	public boolean isAccountNonExpired() {
		
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		
		return true;
	}

	@Override
	public boolean isEnabled() {
		
		return true;
	}

	@Override
	public String getUserId() {
		
		return getUsername();
	}

	public SocialUser getUser() {
		return user;
	}

	public void setUser(SocialUser user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "UserDetailsImpl [user=" + user + "]";
	}
	
	

}
