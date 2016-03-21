package org.crama.burrhamilton.service;

import java.time.LocalDate;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

import org.crama.burrhamilton.form.QuestionForm;
import org.crama.burrhamilton.model.Answer;
import org.crama.burrhamilton.model.Question;
import org.crama.burrhamilton.model.SocialUser;
import org.crama.burrhamilton.model.Statement;
import org.crama.burrhamilton.repository.AnswerRepository;
import org.crama.burrhamilton.repository.QuestionRepository;
import org.crama.burrhamilton.repository.StatementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("questionService")
public class QuetionServiceImpl implements QuestionService {

	@Autowired
	private QuestionRepository questionRepository;
	
	@Autowired
	private StatementRepository statementRepository;
	
	@Autowired
	private AnswerRepository answerRepository;
	
	@Override
	public List<Question> getAllQuestions() {
		
		List<Question> questionList = questionRepository.findAll();
		
		Collections.sort(questionList);
		
		return questionList;
		
	}

	@Override
	public Question getQuestion(Long id) {
		
		Question question = questionRepository.findOne(id);
			
		Statement negStatement = question.getNegativeStatement();
		Statement posStatement = question.getPositiveStatement();
		
		List<Answer> negAnswers = negStatement.getAnswers();
		List<Answer> posAnswers = posStatement.getAnswers();
		
		Collections.sort(negAnswers);
		Collections.sort(posAnswers);
		
		question.getNegativeStatement().setAnswers(negAnswers);
		question.getPositiveStatement().setAnswers(posAnswers);
		
		return question;
	}

	@Override
	public void addQuestion(QuestionForm questionForm, SocialUser user) {
		
		String title = questionForm.getTitle();
		String positiveStatement = questionForm.getPositiveStatement();
		String negativeStatement = questionForm.getNegativeStatement();
		
		Statement posStatement = new Statement(positiveStatement);
		Statement savedPosStatement = statementRepository.save(posStatement);
		
		Statement negStatement = new Statement(negativeStatement);
		Statement savedNegStatement = statementRepository.save(negStatement);
		
		Question question = new Question(title, savedPosStatement, savedNegStatement, LocalDate.now(), user);
		Question savedQuestion = questionRepository.save(question);
		
		savedPosStatement.setQuestion(savedQuestion);
		savedNegStatement.setQuestion(savedQuestion);
		
		statementRepository.save(savedPosStatement);
		statementRepository.save(savedNegStatement);
		
	}

	@Override
	public boolean deleteQuestion(Long id) {
		
		Question question = getQuestion(id);
		Statement negStatement = question.getNegativeStatement();
		Statement posStatement = question.getPositiveStatement();
		
		for (Answer answer: negStatement.getAnswers()) {
			answerRepository.deleteAnswer(answer.getId());
		}
		for (Answer answer: posStatement.getAnswers()) {
			answerRepository.deleteAnswer(answer.getId());
		}
		
		negStatement.setQuestion(null);
		posStatement.setQuestion(null);
		negStatement.setAnswers(null);
		posStatement.setAnswers(null);
		statementRepository.save(negStatement);
		statementRepository.save(posStatement);
		
		question.setNegativeStatement(null);
		question.setPositiveStatement(null);
		questionRepository.save(question);
		
		statementRepository.deleteStatement(negStatement.getId());
		statementRepository.deleteStatement(posStatement.getId());
		
		questionRepository.deleteQuestion(id);
		
		
		return true;
	}
	
}
