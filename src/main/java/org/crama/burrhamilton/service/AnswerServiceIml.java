package org.crama.burrhamilton.service;

import java.util.List;
import java.util.Set;

import org.crama.burrhamilton.model.Answer;
import org.crama.burrhamilton.model.Question;
import org.crama.burrhamilton.model.SocialUser;
import org.crama.burrhamilton.model.Statement;
import org.crama.burrhamilton.repository.AnswerRepository;
import org.crama.burrhamilton.repository.StatementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("answerService")
public class AnswerServiceIml implements AnswerService {

	@Autowired
	private AnswerRepository answerRepository;

	@Autowired
	private StatementRepository statementRepository;
	
	@Override
	public Answer saveAnswer(Answer answer) {
		
		Statement statement = answer.getStatement();
		statement.setLikes(statement.getLikes() + 1);
		statementRepository.save(statement);
		
		Answer answerFromDB = answerRepository.save(answer);
		return answerFromDB;
	}

	@Override
	public boolean checkAnswer(Answer answer, SocialUser user) {
		
		Question question = answer.getStatement().getQuestion();
		System.out.println(question);
		List<Answer> positiveAnswers = question.getPositiveStatement().getAnswers();
		List<Answer> negativeAnswers = question.getNegativeStatement().getAnswers();
		
		for (Answer a: positiveAnswers) {
			if (a.getAuthor().equals(user)) {
				System.out.println("User already answered this question (positive)");
				return false;
			}
		}
		for (Answer a: negativeAnswers) {
			if (a.getAuthor().equals(user)) {
				System.out.println("User already answered this question (negative)");
				return false;
			}
		}
		
		return true;
	}

	@Override
	public Answer getAnswer(Long answerId) {
		
		Answer answer = answerRepository.findOne(answerId);
		
		return answer;
	}

	@Override
	public boolean checkVote(Answer answer, SocialUser user) {
		
		Set<SocialUser> userVoteSet = answer.getUserVoteSet();
		return !userVoteSet.contains(user);
		
	}

	@Override
	public void vote(Answer answer, SocialUser user) {
		Set<SocialUser> votedUsers = answer.getUserVoteSet();
		votedUsers.add(user);
		answer.setVotesNum(answer.getVotesNum() + 1);
		answer.setUserVoteSet(votedUsers);
		answerRepository.save(answer);
	}

	@Override
	public boolean deleteAswwer(Answer answer) {
		System.out.println("Delete answer Service");
		
		answerRepository.deleteAnswer(answer.getId());
		return true;
	}
	
}
