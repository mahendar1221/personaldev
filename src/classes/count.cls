public class count {

    public count(ApexPages.StandardController controller) {

    }

   public count()
   {
   
   }
   integer s;
   child__c cc = new child__c();
    public PageReference counting() {
    id ids=apexpages.currentpage().getparameters().get('id');
    cc.id = ids;
    s =[select count() from object2__c where Md_Relationship__r.id =: ids];
    cc.chilCount__c = s;
    update cc;
        return new pagereference('https://na15.salesforce.com/a01/o');
    }
    
     public integer getCount() {
        return s;
    }

}