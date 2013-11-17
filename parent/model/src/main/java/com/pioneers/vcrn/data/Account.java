package com.pioneers.vcrn.data;

import java.io.Serializable;

public class Account implements Serializable{
    /**
     * 
     */
    private static final long serialVersionUID = 5859267768225822691L;
    private long accountId;
	private String username;
	private String password;
	private boolean isActive;
	private String role;

	public long getAccountId() {
		return accountId;
	}

	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

    @Override
    public String toString() {
        return "Account [accountId=" + accountId + ", username=" + username + ", password=" + password + ", isActive="
                + isActive + ", role=" + role + "]";
    }

}
