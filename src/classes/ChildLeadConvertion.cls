public class ChildLeadConvertion {
    ID ids = ApexPages.currentPage().getParameters().get('id');
   
       
    public ChildLeadConvertion(ApexPages.StandardController controller) {

    }
    public pagereference convertionMethod()
    {
        system.debug('ids....'+ids);
        lead mylead = [select id,phone,firstname,lastname,Score__c,company from lead where id = : ids];
        
        Database.LeadConvert lc = new Database.LeadConvert();
       // lc.setLeadId(myLead.id);
        lc.setAccountId(mylead.id);
        Account a = [Select a.Id, a.Description From Account a Where a.Id = :mylead.id];
        system.debug('a.......'+a);
        
        if(lc.AccountId!=null && lc.Accountid==null)
            {
                  
                  lc.getAccountId();
                  insert a; 
              }
              //insert lc;
        return null;
        }
}