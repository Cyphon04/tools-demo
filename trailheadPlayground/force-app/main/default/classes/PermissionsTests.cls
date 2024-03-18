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
private class PermissionsTests {

    @TestSetup
    static void testSetup() {
        Account a = TestFactory.getAccount('No view For You!', true);
        Private_Object__c po = new Private_Object__c(Account__c = a.id, Notes__c = 'foo');
        insert po;
    }

    @isTest
    static void testPositivePermissionSet() {
        User u = [SELECT Name FROM User WHERE Name = 'Harsh Sharma'];
        PermissionSet ps = [SELECT ID,Label FROM PermissionSet WHERE  Label = 'Private Object Access'];
        System.runAs(u)
        {
            Test.startTest();
               Private_Object__c[] pos = [SELECT Id, Account__c, Notes__c FROM Private_Object__c];
            Test.stopTest();
            System.debug('Records-->'+pos.size());
            Assert.areEqual(1,pos.size(),'ERROR');
        }
    }
}