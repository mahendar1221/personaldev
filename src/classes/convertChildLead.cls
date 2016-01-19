public class convertChildLead {

 id leadId = ApexPages.currentPage().getParameters().get('id');
        
  childlead__c lObj = [SELECT id,lastname__c ,company__c ,score__c,PatentLead__r.Id, LookupToAccount__r.Id    from childlead__c where id =: leadid];
    public PageReference convert() {
        Database.LeadConvert lc = new database.LeadConvert();
        
        lc.setLeadId(lObj.PatentLead__r.Id);
        LeadStatus convertStatus = [Select Id, MasterLabel from LeadStatus where IsConverted=true limit 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);
      
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());
        //id accid =lcr.getAccountId();
        lObj.LookupToAccount__r.Id =lcr.getAccountId() ;
        Id oppId = lcr.getOpportunityId();
    
     
        return null;
    }

}