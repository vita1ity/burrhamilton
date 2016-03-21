package org.crama.burrhamilton.service;

import java.util.List;

import org.crama.burrhamilton.form.QuestionForm;
import org.crama.burrhamilton.model.Question;
import org.crama.burrhamilton.model.SocialUser;

public interface QuestionService {

	List<Question> getAllQuestions();

	Question getQuestion(Long id);

	void addQuestion(QuestionForm questionForm, SocialUser user);

	boolean deleteQuestion(Long id);

}
