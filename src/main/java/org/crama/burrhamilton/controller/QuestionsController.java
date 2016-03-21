package org.crama.burrhamilton.controller;

import java.util.List;

import javax.validation.Valid;

import org.crama.burrhamilton.form.QuestionForm;
import org.crama.burrhamilton.model.Question;
import org.crama.burrhamilton.model.SocialUser;
import org.crama.burrhamilton.service.QuestionService;
import org.crama.burrhamilton.service.UserService;
import org.crama.burrhamilton.util.Util;
import org.crama.burrhamilton.validator.QuestionFormValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class QuestionsController {
	
	@Autowired
	private QuestionFormValidator questionFormValidator;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private UserService userService;
	
	@InitBinder("questionForm")
	protected void initQuestionBinder(WebDataBinder binder) {
		binder.setValidator(questionFormValidator);
	}
	
	@RequestMapping(value="/", method=RequestMethod.GET)
    public String getQuestions(Model model) {
		
		List<Question> allQuestions = questionService.getAllQuestions();
		model.addAttribute("allQuestions", allQuestions);
		
        return "questions";
    }
	
	@RequestMapping(value="/question/{id}", method=RequestMethod.GET)
    public String discussionPage(Model model, @PathVariable Long id) {
		
		Question question = questionService.getQuestion(id);
		
		model.addAttribute("question", question);
		
        return "discussion";
    }
	
	@RequestMapping(value="/question/add", method=RequestMethod.GET)
    public String addQuestionPage(Model model) {
		
		QuestionForm questionForm = new QuestionForm();
		model.addAttribute("questionForm", questionForm);
		
        return "addQuestion";
    }
	
	@RequestMapping(value="/question/add", method=RequestMethod.POST)
    public String addQuestion(@ModelAttribute("questionForm") @Valid QuestionForm questionForm, BindingResult result, 
    		RedirectAttributes redirectAttributes) {
		
		if (result.hasErrors()) {
			return "addQuestion";
		}
		
		SocialUser user = userService.getPrincipal();
		
		questionService.addQuestion(questionForm, user);
		
		Util.flash(redirectAttributes, "success", "questionAddedSuccess");
		
		return "redirect:/question/add";
		
	}
	
	
	@RequestMapping(value="/question/delete/{id}", method=RequestMethod.POST)
    public @ResponseBody boolean deleteQuestion(Model model, @PathVariable Long id) {
		
		return questionService.deleteQuestion(id);
		
    }
	
	
}
