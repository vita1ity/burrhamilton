package org.crama.burrhamilton.service;

import org.crama.burrhamilton.model.Statement;
import org.crama.burrhamilton.repository.StatementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("statementService")
public class StatementServiceImpl implements StatementService {

	@Autowired
	private StatementRepository statementRepository;

	@Override
	public Statement getStatement(Long statementId) {
		
		Statement statement = statementRepository.findOne(statementId);
		
		return statement;
		
	}
	
	
	
}
