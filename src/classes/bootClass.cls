public class bootClass {

    public PageReference BtnSign() {
        for(Custom_Login_Credencials__c userlogin : [select name,password__c from Custom_Login_Credencials__c ]){
        if (inputVal ==userlogin.name && Password ==userlogin.password__c){
            
                      output ='login is sucessful';   

           pagereference pageref= new pagereference('https://na15.salesforce.com/00Q/e?retURL=%2F00Q%2Fo') ;
           return pageref;
              
        }
        else{
                       output ='login is unsucessful';   
                              
        }
        }
        return null;
    }


    public String output { get; set; }

    public pagereference getBtnSign() {
       
        return null ;
        
    }


    public String Password { get; set; }

    public String inputVal { get; set; }
}