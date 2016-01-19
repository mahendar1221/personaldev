public class InsertChildToLead {

    public InsertChildToLead(ApexPages.StandardController controller) {

    }

id ids =ApexPages.currentPage().getParameters().get('id');

    public PageReference InsertOpertion() {
      childlead__c ch=new childlead__c();
      account a=new account();
      list<childlead__c> c = [select id,name,score__c,phone__c from childlead__c where id =:ids];
     
      if(ch.score__c==a.score__c)
         {
           for(childlead__c ld : c)
               {  
                  a.name = ld.name;
                  a.phone=ld.phone__c;
                  a.score__c=ld.score__c;
                  upsert a;
                  PageReference Page = new PageReference('https://na15.salesforce.com/001/o');
                  Page.setRedirect(true);
                  return page;

                 
                 }
                 }
                 return null;
                 }
    
}