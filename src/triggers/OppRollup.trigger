trigger OppRollup on object2__c (after insert, after update, after delete, after undelete) 
{
     object2__c[] objects = null;       
     if (Trigger.isDelete) {
         objects = Trigger.old;
     } else {
        objects = Trigger.new;
     }

     LREngine.Context ctx = new LREngine.Context(
            child__c.SobjectType, // parent object
            object2__C.SobjectType,  // child object                                                    
            Schema.SObjectType.object2__C.fields.Md_Relationship__c); // relationship field name

     ctx.add(new LREngine.RollupSummaryField(
                 Schema.SObjectType.child__c.fields.triggercount__c,
                Schema.SObjectType.object2__C.fields.ChildTriggerCount__c,
                LREngine.RollupOperation.count)); 

    Sobject[] masters = LREngine.rollUp(ctx, objects);    
    update masters;
}