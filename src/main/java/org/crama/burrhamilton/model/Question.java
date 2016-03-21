package org.crama.burrhamilton.model;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "question")
public class Question implements Comparable<Question> {
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "ID")
	private long id;
	
	@Column(name = "QUESTION", nullable = false, length = 10000)
	private String question;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name="POSITIVE_STATEMENT", nullable = true)
	private Statement positiveStatement;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name="NEGATIVE_STATEMENT", nullable = true)
	private Statement negativeStatement;
	
	@Column(name = "POST_DATE", nullable = false)
	private LocalDate postDate;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name="AUTHOR_ID", nullable = false)
	private SocialUser author;

	public Question() {
		super();
	}
	
	public Question(String question, Statement positiveStatement, Statement negativeStatement, LocalDate postDate,
			SocialUser author) {
		super();
		this.question = question;
		this.positiveStatement = positiveStatement;
		this.negativeStatement = negativeStatement;
		this.postDate = postDate;
		this.author = author;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Statement getPositiveStatement() {
		return positiveStatement;
	}

	public void setPositiveStatement(Statement positiveStatement) {
		this.positiveStatement = positiveStatement;
	}

	public Statement getNegativeStatement() {
		return negativeStatement;
	}

	public void setNegativeStatement(Statement negativeStatement) {
		this.negativeStatement = negativeStatement;
	}

	public LocalDate getPostDate() {
		return postDate;
	}

	public void setPostDate(LocalDate postDate) {
		this.postDate = postDate;
	}

	public SocialUser getAuthor() {
		return author;
	}

	public void setAuthor(SocialUser author) {
		this.author = author;
	}

	@Override
	public int compareTo(Question o) {
		
		return o.getPostDate().compareTo(this.getPostDate());
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", question=" + question + ", positiveStatement=" + positiveStatement
				+ ", negativeStatement=" + negativeStatement + ", postDate=" + postDate + ", author=" + author + "]";
	}
	
	
}
