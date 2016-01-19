public class wrapperClassController {

    public list<wrapperAccount> accountList{get;set;} 
    public list<wrapperAccount> getAccounts() {
        if(accountList == null) {
            accountList = new List<wrapperAccount>();
            for(account c: [select Id, Name, billingcity, Phone from account limit 10]) {
                // As each contact is processed we create a new cContact object and add it to the contactList
                accountList.add(new wrapperAccount(c));
            }
        }
        return accountList;
    }


    public PageReference processSelected() {
        return null;
    }
    public class wrapperAccount {
        public account acc {get; set;}
        public Boolean selected {get; set;}

        //This is the contructor method. When we create a new cContact object we pass a Contact that is set to the con property. We also set the selected value to false
        public wrapperAccount(account c) {
            acc = c;
            selected = false;
        }
     }

}