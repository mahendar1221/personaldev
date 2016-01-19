trigger childToParent on ChildLead__c (after insert,after update ) {
    list<lead> listParent=new list<lead>();
    lead objParent = new lead();
    if(checkRecursive.runOnce()){
        for(ChildLead__c ch:trigger.new){
      
        //objParent.id=ch.PatentLead__c;
        objParent.LastName=ch.LastName__c;
        objParent.company=ch.company__c;
        listParent.add(objParent);
        
    }
    insert listParent;
    } 

}