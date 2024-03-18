public without sharing class AccountProcessor {
    
     @Future
     public static void countContacts(List<Id> accountIds)
     {
         List<Account> accounts = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE ID IN :accountIds];
            
         for(Account account : accounts)
         {
           account.Number_of_Contacts__c = account.Contacts.size();
         }
          
         update accounts;
     }
}