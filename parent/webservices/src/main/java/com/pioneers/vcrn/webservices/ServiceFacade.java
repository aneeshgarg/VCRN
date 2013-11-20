package com.pioneers.vcrn.webservices;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.pioneers.vcrn.data.Account;
import com.pioneers.vcrn.request.LoginRequest;

@Path("/facade")
public class ServiceFacade {
    
    @POST
    @Path("/login")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Account login(LoginRequest request) {
        Account account = new AccountService().login(request);
        return account;
    }

}
