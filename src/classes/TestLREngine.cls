@isTest
private class TestLREngine {
// common master records for the test case
static Account acc1, acc2;
// common bunch of detail records for the test case
static Opportunity[] detailRecords;


/*
creates the common seed data using Opportunity and Account objects.
*/
static void prepareData() {
acc1 = new Account(Name = 'Acc1');
acc2 = new Account(Name = 'Acc2');
insert new Account[] {acc1, acc2};

Opportunity o1Acc1 = new Opportunity(
Name = 'o1Acc1',
AccountId = acc1.Id,
Amount = 100.00,
CloseDate = System.today(),
StageName = 'test'
);
Opportunity o2Acc1 = new Opportunity(
Name = 'o2Acc1',
AccountId = acc1.Id,
Amount = 300.00,
CloseDate = System.today().addMonths(1),
StageName = 'test'
);

Opportunity o3Acc1 = new Opportunity(
Name = 'o3Acc1',
AccountId = acc1.Id,
Amount = 50.00,
CloseDate = System.today().addMonths(-1),
StageName = 'test'
);

Opportunity o1Acc2 = new Opportunity(
Name = 'o1Acc2',
AccountId = acc2.Id,
Amount = 200.00,
CloseDate = System.today().addMonths(2),
StageName = 'test'
);

Opportunity o2Acc2 = new Opportunity(
Name = 'o2Acc2',
AccountId = acc2.Id,
Amount = 400.00,
CloseDate = System.today().addMonths(3),
StageName = 'test'
);

Opportunity o3Acc2 = new Opportunity(
Name = 'o3Acc2',
AccountId = acc2.Id,
Amount = 300.00,
CloseDate = System.today().addMonths(4),
StageName = 'test'
);
detailRecords = new Opportunity[] {o1Acc1, o2Acc1, o3Acc1, o1Acc2, o2Acc2, o3Acc2};
insert detailRecords;
}


/*
Tests sum and max operations on currency and date fields
*/
    static testMethod void testSumAndMaxOperations() {
     // create seed data
         prepareData();
         
         LREngine.Context ctx = new LREngine.Context(Account.SobjectType,
                                                Opportunity.SobjectType,
                                                Schema.SObjectType.Opportunity.fields.AccountId);
         
         //Select o.TotalOpportunityQuantity, o.ExpectedRevenue, o.CloseDate, o.Account.rollups__SLAExpirationDate__c,
         // o.Account.rollups__NumberofLocations__c, o.AccountId From Opportunity o
         ctx.add(
                new LREngine.RollupSummaryField(
Schema.SObjectType.Account.fields.AnnualRevenue,
Schema.SObjectType.Opportunity.fields.Amount,
LREngine.RollupOperation.Sum
                                             ));
         ctx.add(
          new LREngine.RollupSummaryField(
Schema.SObjectType.Account.fields.SLAExpirationDate__c,
Schema.SObjectType.Opportunity.fields.CloseDate,
LREngine.RollupOperation.Max
                                             ));
                
         Sobject[] masters = LREngine.rollUp(ctx, detailRecords);
         // 2 masters should be back
         System.assertEquals(2, masters.size());
         
         System.debug(masters + ' ' + acc1 + ' ' + acc2);
         Account reloadedAcc1, reloadedAcc2;
         for (Sobject so : masters) {
            if (so.Id == acc1.id) reloadedAcc1 = (Account)so;
            if (so.Id == acc2.id) reloadedAcc2 = (Account)so;
         }
         System.assertEquals(450.00, reloadedAcc1.AnnualRevenue);
         System.assertEquals(900.00, reloadedAcc2.AnnualRevenue);
         
         System.assertEquals(System.today().addMonths(1), reloadedAcc1.SLAExpirationDate__c);
         System.assertEquals(System.today().addMonths(4), reloadedAcc2.SLAExpirationDate__c);
         
    }
    
    
    /*
Tests sum and max operations on currency and date fields
*/
    static testMethod void testAvgAndCountOperations() {
     // create seed data
         prepareData();
         
         LREngine.Context ctx = new LREngine.Context(Account.SobjectType,
                                                Opportunity.SobjectType,
                                                Schema.SObjectType.Opportunity.fields.AccountId);
         
         //Select o.TotalOpportunityQuantity, o.ExpectedRevenue, o.CloseDate, o.Account.rollups__SLAExpirationDate__c,
         // o.Account.rollups__NumberofLocations__c, o.AccountId From Opportunity o
         ctx.add(
                new LREngine.RollupSummaryField(
Schema.SObjectType.Account.fields.AnnualRevenue,
Schema.SObjectType.Opportunity.fields.Amount,
LREngine.RollupOperation.Avg
                                             ));
         ctx.add(
          new LREngine.RollupSummaryField(
Schema.SObjectType.Account.fields.NumberofLocations__c,
Schema.SObjectType.Opportunity.fields.CloseDate,
LREngine.RollupOperation.Count
                                             ));
                
         Sobject[] masters = LREngine.rollUp(ctx, detailRecords);
         // 2 masters should be back
         System.assertEquals(2, masters.size());
         
         System.debug(masters + ' ' + acc1 + ' ' + acc2);
         Account reloadedAcc1, reloadedAcc2;
         for (Sobject so : masters) {
            if (so.Id == acc1.id) reloadedAcc1 = (Account)so;
            if (so.Id == acc2.id) reloadedAcc2 = (Account)so;
         }
         // avg would be (50 + 100 + 300) / 3 = 150
         System.assertEquals(150.00, reloadedAcc1.AnnualRevenue);
         System.assertEquals(300.00, reloadedAcc2.AnnualRevenue);
         
         System.assertEquals(3, reloadedAcc1.NumberofLocations__c);
         System.assertEquals(3, reloadedAcc2.NumberofLocations__c);
    }
    
    
    
    /*
Tests sum and max operations on currency and date fields
Here we will pass our custom criteria to filter certain records in detail, just like master detail rollup fields
*/
    static testMethod void testAvgAndCountOperationsWithFilter() {
     // create seed data
         prepareData();
         
         LREngine.Context ctx = new LREngine.Context(Account.SobjectType,
                                                Opportunity.SobjectType,
                                                Schema.SObjectType.Opportunity.fields.AccountId,
                                                'Amount > 200' // filter out any opps with amount less than 200
                                                );
         
         //Select o.TotalOpportunityQuantity, o.ExpectedRevenue, o.CloseDate, o.Account.rollups__SLAExpirationDate__c,
         // o.Account.rollups__NumberofLocations__c, o.AccountId From Opportunity o
         ctx.add(
                new LREngine.RollupSummaryField(
Schema.SObjectType.Account.fields.AnnualRevenue,
Schema.SObjectType.Opportunity.fields.Amount,
LREngine.RollupOperation.Avg
                                             ));
         ctx.add(
          new LREngine.RollupSummaryField(
Schema.SObjectType.Account.fields.NumberofLocations__c,
Schema.SObjectType.Opportunity.fields.CloseDate,
LREngine.RollupOperation.Count
                                             ));
                
         Sobject[] masters = LREngine.rollUp(ctx, detailRecords);
         // 2 masters should be back
         System.assertEquals(2, masters.size());
         
         System.debug(masters + ' ' + acc1 + ' ' + acc2);
         Account reloadedAcc1, reloadedAcc2;
         for (Sobject so : masters) {
            if (so.Id == acc1.id) reloadedAcc1 = (Account)so;
            if (so.Id == acc2.id) reloadedAcc2 = (Account)so;
         }
         // avg would be 300 as other two records of amount 50 and 100 should be skipped
         System.assertEquals(300, reloadedAcc1.AnnualRevenue);
         System.assertEquals(350.00, reloadedAcc2.AnnualRevenue);
         
         System.assertEquals(1, reloadedAcc1.NumberofLocations__c);
         System.assertEquals(2, reloadedAcc2.NumberofLocations__c);
    }
    
    
    
     
    /*
     Fixed crash when using field names longer then 25 chars.
     System.QueryException: alias is too long, maximum of 25 characters: Annualized_Recurring_Revenue__c
*/
/*
To test this please create a custom Number field by api name "Annualized_Recurring_Revenue__c" in Opportunity
  Then uncomment this test method
    static testMethod void testLongDetailFields() {
     // create seed data
         prepareData();
         
         LREngine.Context ctx = new LREngine.Context(Account.SobjectType,
                                                Opportunity.SobjectType,
                                                Schema.SObjectType.Opportunity.fields.AccountId,
                                                'Amount > 200' // filter out any opps with amount less than 200
                                                );
         
         ctx.add(
                new LREngine.RollupSummaryField(
Schema.SObjectType.Account.fields.NumberofLocations__c,
Schema.SObjectType.Opportunity.fields.Annualized_Recurring_Revenue__c,
LREngine.RollupOperation.Count
                                             ));
                
         Sobject[] masters = LREngine.rollUp(ctx, detailRecords);
         // 2 masters should be back
         System.assertEquals(2, masters.size());
         
         Account reloadedAcc1, reloadedAcc2;
         for (Sobject so : masters) {
            if (so.Id == acc1.id) reloadedAcc1 = (Account)so;
            if (so.Id == acc2.id) reloadedAcc2 = (Account)so;
         }
         
         System.assertEquals(1, reloadedAcc1.NumberofLocations__c);
         System.assertEquals(2, reloadedAcc2.NumberofLocations__c);
    }
    */
}