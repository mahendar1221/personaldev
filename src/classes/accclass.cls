public class accclass {
    ApexPages.StandardController stdController;
    account acc ;
    public accclass(){
    
    
    }
    public PageReference saveacc() {
        //this.acc1 = (Account)stdController.getRecord();
        acc = [select id,phone,name from account limit 1];
        system.debug('acc info ....'+getacc());
        upsert acc;
        return null;
    }


    public account acc1 { get; set; }

    public account getAcc() {
        return acc;
    }

}