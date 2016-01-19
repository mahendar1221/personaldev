public class loginLogic {

    public String output { get; set; }

    public String loginpass { get; set; }

    public String loginname { get; set; }

    public PageReference LoginLgic() {
        for(Custom_Login_Credencials__c userlogin : [select name,password__c from Custom_Login_Credencials__c ]){
        if (loginname==userlogin.name && loginpass==userlogin.password__c){
            
           output ='login is sucessful';   
           pagereference pageref= new pagereference('https://na15.salesforce.com/00Q/e?retURL=%2F00Q%2Fo') ;
           return pageref;
              
        }
        else{
            
            output= 'User/Password wrong';
        }
        }
        return  null;
    }
}