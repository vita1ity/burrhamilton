package org.crama.burrhamilton.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WriteController {
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
    public String writePage() {
		
        return "write";
    }
	
}
