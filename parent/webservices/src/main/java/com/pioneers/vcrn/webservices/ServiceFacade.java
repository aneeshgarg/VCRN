package com.pioneers.vcrn.webservices;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import com.pioneers.vcrn.data.Account;
import com.pioneers.vcrn.request.LoginRequest;

@Path("/facade")
public class ServiceFacade {
    
    @POST
    @Path("/login")
    @Consumes("application/json")
    @Produces("application/json")
    public Account login(LoginRequest request) {
        Account account = new Account();
        account.setAccountId(123333);
        account.setActive(true);
        account.setRole("Doctor");
        account.setUsername("bob");
        return account;
    }
    
    @GET
    @Path("/loginget")
    @Produces("application/json")
    public Account login() {
        Account account = new Account();
        account.setAccountId(123333);
        account.setActive(true);
        account.setRole("Doctor");
        account.setUsername("bob");
        return account;
    }

}
