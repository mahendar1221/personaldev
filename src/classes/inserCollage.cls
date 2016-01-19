public class inserCollage {

    public account coll1 { get; set; }
 public account coll; 
 public inserCollage(){ 
  coll1  =  new account();  
  } 
 public account getcoll(){ return coll; }
  public PageReference save() {
   insert coll1;
    PageReference pref = new ApexPages.StandardController(coll1).view();
     return pref; }
      }