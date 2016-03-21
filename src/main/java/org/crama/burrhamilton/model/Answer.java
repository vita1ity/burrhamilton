package org.crama.burrhamilton.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "answer")
public class Answer implements Comparable<Answer> {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	private long id;
	
	@Column(name = "ANSWER", nullable = false, length = 10000)
	private String answer;
	
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "STATEMENT", nullable = false)
	private Statement statement;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name="AUTHOR_ID", nullable = false)
	private SocialUser author;
	
	@Column(name = "VOTES_NUM", nullable = false)
	private int votesNum;
	
	@JsonIgnore
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "votes", 
    joinColumns = { 
           @JoinColumn(name = "ANSWER_ID")
    }, 
    inverseJoinColumns = { 
           @JoinColumn(name = "USER_ID")
    })
	private Set<SocialUser> userVoteSet = new HashSet<SocialUser>();
	
	public Answer() {
		super();
	}
	
	public Answer(Statement statement, String answer, SocialUser user) {
		super();
		this.answer = answer;
		this.statement = statement;
		this.author = user;
		this.votesNum = 0;
		
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public SocialUser getAuthor() {
		return author;
	}

	public void setAuthor(SocialUser author) {
		this.author = author;
	}

	public int getVotesNum() {
		return votesNum;
	}

	public void setVotesNum(int votesNum) {
		this.votesNum = votesNum;
	}

	public Set<SocialUser> getUserVoteSet() {
		return userVoteSet;
	}

	public void setUserVoteSet(Set<SocialUser> userVoteSet) {
		this.userVoteSet = userVoteSet;
	}

	public Statement getStatement() {
		return statement;
	}

	public void setStatement(Statement statement) {
		this.statement = statement;
	}

	@Override
	public String toString() {
		return "Answer [id=" + id + ", answer=" + answer + ", author=" + author + ", votesNum=" + votesNum
				+ ", userVoteSet=" + userVoteSet + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Answer other = (Answer) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public int compareTo(Answer o) {
		
		return o.votesNum - this.votesNum;
	}

	
	
}
