global with sharing class emailNotificationSender {        
    global  class EmailWrapper {
        public String Toaddesses;
        public String Subject;
        public String HtmlBody;        
        public Boolean validationError;
        public String customMessage;
        global final String STATUS_FAIL = 'failed';
        global final String STATUS_SUCCESS = 'success';   
        global final String TO_ADDRESSES = 'Does not contain valid email addresses';  
      
     public Boolean validateData()  {     
        if(Toaddesses==null){
            validationError=true;
            customMessage = TO_ADDRESSES;
        } 
        return false;       
     }
     }
        public static List<emailNotificationSender.EmailWrapper> sendemail(List<emailNotificationSender.EmailWrapper> lstEmailWrapper)  {
        for(emailNotificationSender.EmailWrapper Ewrap : lstEmailWrapper)  {
            emailNotification.sendTheEmail(Ewrap.Toaddesses,Ewrap.Subject,Ewrap.HtmlBody);    
        }
        return null;
     }
 }