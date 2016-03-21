package org.crama.burrhamilton.repository;

import javax.transaction.Transactional;

import org.crama.burrhamilton.model.Answer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository("answerRepository")

public interface AnswerRepository extends JpaRepository<Answer, Long> {
	
	@Modifying
    @Transactional
    @Query("delete from Answer a where a.id = ?")
    void deleteAnswer(Long id);
}
