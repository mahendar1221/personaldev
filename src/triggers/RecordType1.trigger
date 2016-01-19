trigger RecordType1 on Account (before insert, before update) {
       for(account a :trigger.new){
        string s=a.PickList_Types__c;       
        if(a.PickList_Types__c!=null){            
            a.recordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get(s).getrecordtypeid();

        
        }
    }
}