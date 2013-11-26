package com.pioneers.vcrn.data;

import java.util.Date;

/**
 * @author Aneesh Garg
 * 
 */
public class PersonInfo extends BaseObject {
    /**
     * 
     */
    private static final long serialVersionUID = -6878636187760940801L;
    private String firstName;
    private String lastName;
    private String email;
    private String gender;
    private Date   dob;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("PersonInfo [firstName=").append(firstName).append(", lastName=").append(lastName).append(", email=").append(email)
                .append(", gender=").append(gender).append(", dob=").append(dob).append("]");
        return builder.toString();
    }
}
