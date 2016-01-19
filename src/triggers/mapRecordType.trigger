trigger mapRecordType on Account (before insert, before update) {
    Schema.DescribeSObjectResult d = Schema.SObjectType.Account;
    Map<string,Schema.RecordTypeInfo> rtMapByName = d.getRecordTypeInfosByName();    
    
    for(account a :trigger.new){
        string s=a.PickList_Types__c;       
        if(a.PickList_Types__c!=null){            
              
                a.recordtypeid = rtMapByName.get(s).getrecordtypeid();
        
        }
    }
}