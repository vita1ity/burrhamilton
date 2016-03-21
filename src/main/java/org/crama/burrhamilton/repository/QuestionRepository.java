package org.crama.burrhamilton.repository;

import javax.transaction.Transactional;

import org.crama.burrhamilton.model.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository("questionRepository")
public interface QuestionRepository extends JpaRepository<Question, Long> {
	
	@Modifying
    @Transactional
    @Query("delete from Question q where q.id = ?")
    void deleteQuestion(Long id);
	
}
