package com.pioneers.vcrn.webservices;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.pioneers.vcrn.data.Account;
import com.pioneers.vcrn.data.MedicalProfessional;
import com.pioneers.vcrn.data.Patient;
import com.pioneers.vcrn.request.LoginRequest;
import com.pioneers.vcrn.request.RehabLogRequest;
import com.pioneers.vcrn.response.RehabTemplateResponse;

@Path("/facade")
public class ServiceFacade {
    
    @POST
    @Path("/login")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Account login(LoginRequest request) throws Exception {
        Account account = new AccountService().login(request);
        return account;
    }
    
    @GET
    @Path("/getmpinfo/{accountId}")
    public MedicalProfessional getMPInfo(@PathParam("accountId")long accountId) throws Exception {
        MedicalProfessional mp = null;
        mp = new AccountService().getMPInfo(accountId);
        return mp;
    }
    
    @GET
    @Path("/getpatientinfo/{accountId}")
    public Patient getPatientInfo(@PathParam("accountId")long accountId) throws Exception {
        Patient patient = null;
        patient = new AccountService().getPatientInfo(accountId);
        return patient;
    }
    
    @GET
    @Path("/getrehabtemplates")
    public RehabTemplateResponse getReahabTemplates() throws Exception {
        return new SupportService().getRehabTemplates();
    }
    
    @POST
    @Path("/savelog")
    @Consumes(MediaType.APPLICATION_JSON)
    public void  saveRehabLog(RehabLogRequest logRequest) throws Exception {
        new CoreService().saveLog(logRequest);
    }

}
