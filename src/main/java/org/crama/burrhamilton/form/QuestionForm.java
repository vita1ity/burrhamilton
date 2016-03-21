package org.crama.burrhamilton.form;

import javax.validation.constraints.NotNull;

public class QuestionForm {

	@NotNull
	private String title;
	
	@NotNull
	private String positiveStatement;
	
	@NotNull
	private String negativeStatement;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPositiveStatement() {
		return positiveStatement;
	}

	public void setPositiveStatement(String positiveStatement) {
		this.positiveStatement = positiveStatement;
	}

	public String getNegativeStatement() {
		return negativeStatement;
	}

	public void setNegativeStatement(String negativeStatement) {
		this.negativeStatement = negativeStatement;
	}
	
}
