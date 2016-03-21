package org.crama.burrhamilton.model;

public enum UserRole {
	ROLE_USER(0),
	ROLE_ADMIN(1);
			
	private final int value;
    private UserRole(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
