public class EmailMissionSpecialist {
    
    public void sendMail(String address,String subject,String body)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddress = new String[]{address};
        mail.setToAddresses(toAddress);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
            									new Messaging.SingleEmailMessage[] {mail});
        
        inspectResults(results);
        
    }
    
    public static Boolean inspectResults(Messaging.SendEmailResult[] results)
    {
        Boolean sendResult = true;
        
        for(Messaging.SendEmailResult res : results)
        {
            if(res.isSuccess())
            {
                System.debug('Email Sent ');
                
            }
        }
        return sendResult;
    }
    
}