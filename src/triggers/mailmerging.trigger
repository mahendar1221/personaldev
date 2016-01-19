trigger mailmerging on Lead (before insert,after insert) {
    set<string> ids = new set<string>();    
    map<string,lead> maplead=new map<string,lead>();
    list<lead> updatelist = new list<lead>();
    list<string> deletelist = new list<string>();   
    for(lead lobj : trigger.new){
        if(lobj.email!=null)ids.add(lobj.email);    
    }
    list<lead> leadlist = new list<lead>([select id,lastname,email from lead where email in : ids ]);
    if(trigger.isbefore){
        for(lead lobj : trigger.new){       
            for(lead dupobj : leadlist){
                if(lobj!=null && lobj.email==dupobj.email ){               
                    dupobj.lastname=lobj.lastname;
                    dupobj.company =lobj.company;
                    dupobj.status = lobj.status; 
                    lobj.IsDuplicate__c='Yes';               
                    updatelist.add(dupobj);
                    system.debug('inside the duplicate');     
                    //deletelist.add(lobj);                            
                }
            }
        }
    }
    if(trigger.isafter){
        for(lead lobj : system.trigger.new){
            if(lobj.IsDuplicate__c=='Yes' ){
                deletelist.add(lobj.id);
                
            }
        }
    }      
    if(deletelist.size()>0) database.delete (deletelist);   
    if(updatelist.size()>0) update updatelist;
}