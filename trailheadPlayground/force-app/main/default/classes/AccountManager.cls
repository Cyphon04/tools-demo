/**
 * @description       : 
 * @author            : sha.harsh@concret.io
 * @group             : 
 * @last modified on  : 02-21-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
    @HTTPGet
    global static Account getAccount() {
        //Handling the Request
        String accountID = RestContext.request.requestURI.substringBetween('Accounts/','/contacts');
        //Processing the request 
        Account result = [SELECT Id,Name,(SELECT Id, FirstName, LastName FROM Contacts) FROM Account WHERE Id = :accountId];
        //returning the response
        return result;
    }
}