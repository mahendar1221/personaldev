trigger advancedTrriger on Lead (before insert,after insert) {   
    list<lead> ids = new list<lead>([select id,lastname from lead]);
    list<lead> dupes = new list<lead>(); 
    list<lead> updates  = new list<lead>();    
   for(lead newobj : trigger.new){
       for(integer l=0;l<ids.size();l++){
           if(newobj.lastname==ids[l].lastname && trigger.isbefore){
               ids[l].email = newobj.email;
               ids[l].firstname = newobj.firstname;
               ids[l].company = newobj.company;    
               dupes.add(newobj);
              updates.add(ids[l]);
           }       
       }
      
   }
        if(dupes.size()>0) update updates;
       if(trigger.isafter) database.delete (dupes);
    
}