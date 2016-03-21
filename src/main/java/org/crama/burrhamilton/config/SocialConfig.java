package org.crama.burrhamilton.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.social.UserIdSource;
import org.springframework.social.config.annotation.ConnectionFactoryConfigurer;
import org.springframework.social.config.annotation.SocialConfigurerAdapter;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.linkedin.connect.LinkedInConnectionFactory;
import org.springframework.social.security.AuthenticationNameUserIdSource;
import org.springframework.social.twitter.connect.TwitterConnectionFactory;

@Configuration
public class SocialConfig extends SocialConfigurerAdapter {
	
	@Autowired
	private DataSource dataSource;
	
	
	@Override
    public void addConnectionFactories(ConnectionFactoryConfigurer cfConfig, Environment env) {
		
		cfConfig.addConnectionFactory(new LinkedInConnectionFactory(
			     env.getProperty("linkedin.consumer.key"),
			     env.getProperty("linkedin.consumer.secret")
		));
		
        cfConfig.addConnectionFactory(new TwitterConnectionFactory(
                env.getProperty("twitter.consumer.key"),
                env.getProperty("twitter.consumer.secret")
        ));
        cfConfig.addConnectionFactory(new GoogleConnectionFactory(
        		env.getProperty("google.clientId"),
                env.getProperty("google.clientSecret")
        ));	
        /*
        cfConfig.addConnectionFactory(new FacebookConnectionFactory(
                env.getProperty("spring.social.facebook.appId"),
                env.getProperty("spring.social.facebook.appSecret")
        ));*/
    }
	
	@Override
	public UsersConnectionRepository getUsersConnectionRepository(ConnectionFactoryLocator connectionFactoryLocator) {
		return new JdbcUsersConnectionRepository (
				dataSource,
				connectionFactoryLocator,
				Encryptors.noOpText()
		);
	}
	
	@Bean
	public ProviderSignInUtils providerSignInUtils(ConnectionFactoryLocator connectionFactoryLocator,
			UsersConnectionRepository connectionRepository) {
		return new ProviderSignInUtils(connectionFactoryLocator, connectionRepository);
	}
	
	@Override
	public UserIdSource getUserIdSource() {
		return new AuthenticationNameUserIdSource();
	}
}
