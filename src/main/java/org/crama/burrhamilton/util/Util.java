package org.crama.burrhamilton.util;

import java.util.Locale;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Component
public class Util {

	private static MessageSource messageSource;
	
	private static Random rand = new Random();
	
	@Autowired
	public void setMessageSource(MessageSource messageSource) {
		
		Util.messageSource = messageSource;
		
	}
	
	public static String getMessage(String messageKey, Object... args) {
		System.out.println(messageSource);
		return messageSource.getMessage(messageKey, args, Locale.getDefault());
	}
	
	public static void flash(RedirectAttributes redirectAttributes, String kind, String messageKey) {
		redirectAttributes.addFlashAttribute("flashKind", kind);
		redirectAttributes.addFlashAttribute("flashMessage", Util.getMessage(messageKey));
	}

	
	public static String getSaltString(int passLength) {
		if (passLength < 0) {
			return null;
		}
        String SALTCHARS = "abcdefghijklmnoprstuvwxyz1234567890";
        StringBuilder salt = new StringBuilder();
        
        while (salt.length() < passLength) {
            int index = (int) (rand.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
	
}
