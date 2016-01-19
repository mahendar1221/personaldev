public class signalColor {

public boolean yellow { get; set; }

    public boolean green { get; set; }

    public boolean red { get; set; }             
    public String colour2 { get; set; }
    public String colour1 { get; set; }
    public String colour { get; set; }
    Signal__c sobj = new Signal__c();
        List<SelectOption> signalvalues= new List<SelectOption>(); 
        List<SelectOption> signal2values= new List<SelectOption>();
        List<SelectOption> signal3values= new List<SelectOption>(); 
        
    public signalColor(){
        red=false;
        green=false;
        yellow=false;
    }
    


     public list<selectoption> getSelectedcolour() {
        Schema.DescribeFieldResult fieldResult = Signal__c.Signal_Color__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry f : ple){
            signalvalues.add(new SelectOption(f.getLabel(), f.getValue()));
        } 
        return signalvalues;
    }
    public list<selectoption> getSelectedcolour1() {
        Schema.DescribeFieldResult fieldResult = Signal__c.Signal_Color2__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry f : ple){
            signal2values.add(new SelectOption(f.getLabel(), f.getValue()));
        }
        return signal2values;
    }
    public list<selectoption> getSelectedcolour2() {
        Schema.DescribeFieldResult fieldResult = Signal__c.Signal_Color3__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry f : ple) {
            signal3values.add(new SelectOption(f.getLabel(), f.getValue()));
        }      
        return signal3values;
    }
   
    public PageReference colourDisplay() {
        sobj.Signal_Color__c = colour;
        sobj.Signal_Color2__c= colour1;
        sobj.Signal_Color3__c=colour2;
        system.debug(sobj.Signal_Color__c);
        system.debug(sobj.Signal_Color2__c);
        system.debug(sobj.Signal_Color3__c);
        
        if(sobj.Signal_Color__c == 'red' && sobj.Signal_Color2__c == 'red' && sobj.Signal_Color3__c == 'red'){
            
            red=true;
            yellow=false;
            green=false;
                }
        else if(sobj.Signal_Color__c == 'green' && sobj.Signal_Color2__c == 'green' && sobj.Signal_Color3__c == 'green'){
            
            green = true;
            red=false;
            yellow=false;
            
        }
        else if(sobj.Signal_Color__c == 'yellow' && sobj.Signal_Color2__c == 'yellow' && sobj.Signal_Color3__c == 'yellow'){
            yellow=true;
            green=false;
            red=false;
        }    
        else {
            red= true;
            green=false;
            yellow=false;
             
        }   
        signalvalues.clear();
        signal2values.clear();
        signal3values.clear();
        return null;
    }
        
  }