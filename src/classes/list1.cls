public class list1 {
        list<lead> leadobj = new list<lead>([select name from lead limit 5]);
        public list<lead> getLead() {
        string u = apexpages.currentpage().geturl();
         
        system.debug(u);
        return leadobj;
    }
}