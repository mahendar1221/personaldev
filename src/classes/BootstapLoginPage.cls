public class BootstapLoginPage {
    public String Password { get; set; }
    public string output{ get; set; }
    public String userName { get; set; }
    public PageReference LoginAction() {
        for(Custom_Login_Credencials__c userlogin : [select name,password__c from Custom_Login_Credencials__c ]){
            if(username.contains('.com')){
                if(userlogin.name==username &&  userlogin.password__c==Password){
                     pagereference pageref= new pagereference('https://na15.salesforce.com/00Q/e?retURL=%2F00Q%2Fo') ;
                     return pageref;
                }
            }
            if(userName==''||Password==''){
                output='Username/password cannot be empty:';
            }
            else if(userlogin.name!=userName || userlogin.password__c!=password){
                output = 'Please enter a valid email address/Password ';
            }
        }
         return null;
    }
}