trigger countChildLead on lead (after insert,after update) {    
          for(lead a : trigger.new){
             List<childlead__c> nps= new List<childlead__c>();
              nps= [SELECT Id FROM childlead__c WHERE id =: a.Id];
            
              a.triggercount__c = nps.size(); 
              system.debug('count...'+nps.size());
                      
          }
}