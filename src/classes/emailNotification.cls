public class emailNotification{

    public String tevfpageuiuiu { get; set; }
    public static void sendTheEmail(string toaddress,string subject,string Htmlbody ) {   
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new string[]{};
            if(toaddress.contains(';'))toAddresses = toaddress.split('\\;');
            else toAddresses.add(toaddress);
            String[] ccAddresses = new String[] {
                userinfo.getUserEmail()
            };            
            mail.setToAddresses(toAddresses);
            //mail.setCcAddresses(ccAddresses);
            //mail.setReplyTo('myemail@mail.com');
            //mail.setSenderDisplayName('crmadmin');
            mail.setSubject(subject);
            mail.setBccSender(false);
            mail.setUseSignature(false);
            //mail.setPlainTextBody('This is test ,When call recording is not found.....');
            mail.setHtmlBody(Htmlbody );
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
}