package org.crama.burrhamilton.service;

import org.crama.burrhamilton.model.Answer;
import org.crama.burrhamilton.model.SocialUser;

public interface AnswerService {

	Answer saveAnswer(Answer answer);

	boolean checkAnswer(Answer answer, SocialUser user);

	Answer getAnswer(Long answerId);

	boolean checkVote(Answer answer, SocialUser user);

	void vote(Answer answer, SocialUser user);

	boolean deleteAswwer(Answer answer);

}
