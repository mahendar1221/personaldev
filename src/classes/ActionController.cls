public class ActionController{
    public List<SelectOption> Alphabets {get; set;}
    public List<SelectOption> Fruits {get; set;}
   
    public String SelectedAlphabet {get; set;}
   
    /*A Constructor which will build the intial list of Alphabets*/
    public ActionController(){
        Alphabets = new List<SelectOption>();
        Fruits    = new List<SelectOption>();
       
         /*This is to add the NONE option for our Picklists*/
        SelectOption option = new SelectOption('--None--', '--None--');
        Alphabets.add(option);
        Fruits.add(option);
       
        option = new SelectOption('A', 'A');
        Alphabets.add(option);
       
        option = new SelectOption('B', 'B');
        Alphabets.add(option);       
    }
     public void createFruitList(){
        /*Always clear the List when begin so that previous values will be removed.*/
        Fruits.clear();
       
        Fruits.add(new SelectOption('--None--', 'None'));
       
        if(SelectedAlphabet == 'A'){
            Fruits.add(new SelectOption('Apple','Apple'));
            Fruits.add(new SelectOption('Apricot','Apricot'));
        }
        else if(SelectedAlphabet == 'B'){
            Fruits.add(new SelectOption('Banana','Banana'));
            Fruits.add(new SelectOption('Blackberry','Blackberry'));
        }
    }
}