package org.crama.burrhamilton;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("org.crama.burrhamilton")
public class BurrhamiltonApplication extends SpringBootServletInitializer {

	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(BurrhamiltonApplication.class);
    }
	
	public static void main(String[] args) {
		SpringApplication.run(BurrhamiltonApplication.class, args);
	}
}
