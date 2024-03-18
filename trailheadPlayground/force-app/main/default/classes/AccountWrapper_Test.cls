/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class AccountWrapper_Test {

    @testSetup static void loadTestData(){ 
        List<Account> accounts = (List<Account>) Test.loadData(Account.SObjectType, 'accountData');
        List<Opportunity> opps = new List<Opportunity>();
        for(Account a : accounts){
          // opps.addAll(TestFactory.generateOppsForAccount(a.id, 1000.00, 5));
        }
        insert opps;
    }

    @isTest static void testPositiveRoundedAveragePrice() {

        List<AccountWrapper> accounts = new List<AccountWrapper>();
        for(Account a : [SELECT ID, Name FROM ACCOUNT]){    
          accounts.add(new AccountWrapper(a));
        }
        // sanity check asserting that we have opportunities before executing our tested method. 
        List<Opportunity> sanityCheckListOfOpps = [SELECT ID FROM Opportunity];    
        System.assert(sanityCheckListOfOpps.size() > 0, 'You need an opportunity to continue');    
        Test.startTest();    
        for(AccountWrapper a : accounts){    
            System.assertEquals(a.getRoundedAvgPriceOfOpps(), 1000.00, 'Expected to get 1000.00');
            System.assert(!a.isHighPriority());    
        }    
        Test.stopTest();
    }
}