public with sharing class AccountController 
{
    public static List<Account> getAllActiveAccounts()
    {
        System.debug('test2');
        System.debug('master');
        
        return [
            SELECT Id, Name, Active__c 
            FROM Account 
            WHERE Active__c = 'YES'
        ];
    }
}

