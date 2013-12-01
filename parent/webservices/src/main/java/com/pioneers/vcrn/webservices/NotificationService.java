package com.pioneers.vcrn.webservices;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.pioneers.vcrn.data.Account;
import com.pioneers.vcrn.data.Notification;
import com.pioneers.vcrn.datastore.NotificationDatastore;

/**
 * 
 * @author Aneesh Garg
 * @since Nov 22, 2013
 */
public class NotificationService {

    private static final String PASSWORD = "pioneers123";
    private static final String SENDER_EMAIL = "vcrnpioneers@gmail.com";
    private static final String USERNAME = "vcrnpioneers";

    public void processNotification(Notification notification) throws Exception {

        if (notification != null) {
            insertNotification(notification);
            sendMail(notification);
        }

    }

    private void sendMail(Notification notification) throws Exception {
        AccountService service = new AccountService();
        Account patient = service.getAccountInfo(notification.getPatientId());
        Account mp = service.getAccountInfo(notification.getDoctorId());
        
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USERNAME, PASSWORD);
            }
        });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(SENDER_EMAIL));
            message.setSubject(patient.getFirstName() + ": " +notification.getSubject());
            message.setText(patient.getFirstName() + " has "+notification.getMessage());

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {

            System.out.println(e.getMessage());
            //throw new RuntimeException(e);
        }

    }

    private void insertNotification(Notification notification) throws Exception {
        new NotificationDatastore().insertNotification(notification);

    }

}
