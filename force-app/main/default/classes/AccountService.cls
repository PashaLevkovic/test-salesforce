@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountService {

    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);
        Account result = [SELECT Name, Phone, Industry FROM Account WHERE Id =: accountId];
        return result;
    }

}