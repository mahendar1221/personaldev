trigger  customCode on Lead (before insert,before update) {       
    for(lead l : system.trigger.new){
    if(l.Title!=null)l.score__c = l.Title.length();             
    }   
}