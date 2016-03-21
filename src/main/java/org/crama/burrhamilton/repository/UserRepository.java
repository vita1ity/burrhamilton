package org.crama.burrhamilton.repository;

import org.crama.burrhamilton.model.SocialUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("userRepository")
public interface UserRepository extends JpaRepository<SocialUser, Long> {

	SocialUser findByUniqueKey(String uniqueKey);

}
