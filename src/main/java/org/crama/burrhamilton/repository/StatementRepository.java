package org.crama.burrhamilton.repository;

import javax.transaction.Transactional;

import org.crama.burrhamilton.model.Statement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository("statementRepository")
public interface StatementRepository extends JpaRepository<Statement, Long> {
	
	@Modifying
    @Transactional
    @Query("delete from Statement s where s.id = ?")
    void deleteStatement(Long id);
	
}
