public class testcontroller {

    public boolean refresh { get; set; }
    public id pas{get;set;}
    public PageReference cancellead() {
    system.debug(pas);
    lead leobj = new lead(id=pas);
    
    
        selected.add(leobj);
       delete selected;  
    
    selected.clear(); 
        return null;
    }
public testcontroller(){

}
list<lead> selected = new list<lead>();
list<lead> ll = [select id,name from lead limit 5];
    public list<lead> getTestpatam() {
        
        return ll;
    }

}