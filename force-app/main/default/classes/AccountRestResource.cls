@RestResource(urlMapping='/Account/*')
global with sharing class AccountRestResource {
    
    @HttpPost
    global static void createAccount(String accountName, List<String> contacts){
        Account account = new Account(Name = accountName);
        insert account;
        
        List<Contact> contactList = new List<Contact>();
        for(String contactName : contacts){
            Contact contact = new Contact(LastName = contactName, AccountId = account.id);
            contactList.add(contact);
        }
        insert contactList;
    }    
}