public class MyRendered_cls {
    
    public Account acc{set;get;}
    public boolean onclk{set;get;}
    public boolean editpanel{set;get;}
    public boolean viewpanel{set;get;}
    
    public MyRendered_cls(ApexPages.StandardController controller) {
        editpanel=false;
        viewpanel=true;
    }
    /*public MyRendered_cls(){
    
    } */
    
    public pagereference savebutton(){
        editpanel=false;
        viewpanel=true;
        system.debug('gggfgf'+acc);
        return null;
    }
    
    public pagereference cancelbutton(){
        editpanel=false;
        viewpanel=true;
        return null;
    }
    
    public pagereference editButton(){
        editpanel=true;
        viewpanel=false;
        return null;
    }
    public pagereference test1(){
    onclk = true;
    return null;
    }
}