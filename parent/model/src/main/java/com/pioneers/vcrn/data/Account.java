package com.pioneers.vcrn.data;

import java.util.List;

public class Account extends PersonInfo {
    private static final long  serialVersionUID = 5859267768225822691L;
    private long               accountId;
    private String             username;
    private boolean            active;
    private String             role;
    private List<Notification> notificationList;

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

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public List<Notification> getNotificationList() {
        return notificationList;
    }

    public void setNotificationList(List<Notification> notificationList) {
        this.notificationList = notificationList;
    }

    @Override
    public String toString() {
        return "Account [accountId=" + accountId + ", username=" + username + ", active=" + active + ", role=" + role + ", notificationList="
                + notificationList + "]";
    }

}
