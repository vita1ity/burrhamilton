package org.crama.burrhamilton.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.UserProfile;

public class SignUpForm {
	
	@NotNull
	@Size(min = 1, max = 100, message="Username lenth should be less than 100 characters")
	private String username;
	
	@NotNull(message = "Qualification is null")
	private String qualification;
	
	private String imageUrl;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public static SignUpForm fromConnection(Connection<?> connection) {
		
        SignUpForm form = new SignUpForm();
        
        if (connection != null) {
            UserProfile socialMediaProfile = connection.fetchUserProfile();
            
            form.setUsername(socialMediaProfile.getFirstName() + " " + socialMediaProfile.getLastName());
            form.setImageUrl(connection.getImageUrl());
        }
 
        return form;
	}
	
}
