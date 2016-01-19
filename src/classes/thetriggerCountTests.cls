@istest

public class thetriggerCountTests {

    public static testMethod void testriggerCount() {
         
         child__c pa = new child__c(name='tom');
         insert pa;
                  
         object2__c cc = new object2__c(name='jj', Md_Relationship__c=pa.id);         
         
         test.StartTest();
         insert  cc;     
         update cc;
         test.Stoptest();   
    }
}