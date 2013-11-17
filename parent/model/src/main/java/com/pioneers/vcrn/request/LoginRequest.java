package com.pioneers.vcrn.request;

public class LoginRequest extends BaseRequest {
	/**
     * 
     */
    private static final long serialVersionUID = -9030892984328267587L;
    private String username;
	private String password;

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

}
