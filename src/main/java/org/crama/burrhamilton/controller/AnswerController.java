package org.crama.burrhamilton.controller;

import org.crama.burrhamilton.model.Answer;
import org.crama.burrhamilton.model.SocialUser;
import org.crama.burrhamilton.model.Statement;
import org.crama.burrhamilton.service.AnswerService;
import org.crama.burrhamilton.service.StatementService;
import org.crama.burrhamilton.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AnswerController {

	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private StatementService statementService;
	
	@RequestMapping(value="/answer", method=RequestMethod.POST)
    public @ResponseBody Answer saveAnswer(@RequestParam Long statementId, @RequestParam String answer, Model model) {
		
		System.out.println("Answer Controller - POST");
		
		SocialUser user = userService.getPrincipal();
		Statement statement = statementService.getStatement(statementId);
		Answer answerObj = new Answer(statement, answer, user);
	
		Answer savedAnswer = answerService.saveAnswer(answerObj);
		return savedAnswer;
		
	}
	
	@RequestMapping(value="/answer/vote/{answerId}", method=RequestMethod.POST)
    public @ResponseBody boolean saveAnswer(@PathVariable Long answerId, Model model) {
		
		SocialUser user = userService.getPrincipal();
		
		Answer answer = answerService.getAnswer(answerId);
		
		if (answerService.checkVote(answer, user)) {
			System.out.println("User haven't voted yet");
			answerService.vote(answer, user);
			return true;
		}
		else {
			return false;
		}
		
		
	}
	
	
	@RequestMapping(value="/answer/delete/{id}", method=RequestMethod.POST)
    public @ResponseBody boolean deleteAnswer(@PathVariable Long id) {
		
		Answer answer = answerService.getAnswer(id);
		
		return answerService.deleteAswwer(answer);
		
	}
	
}
