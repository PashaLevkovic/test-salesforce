@isTest
public class AccountRestResourceTest {
    
    @isTest
    static void restTest(){
        String accountName = 'Pasha';
        List<String> contacts = new List<String>();
        contacts.add('first');
        contacts.add('second');
        contacts.add('third');
        
       	Test.startTest();
        AccountRestResource.createAccount(accountName, contacts);
        Test.stopTest();
        
        List<Contact> cont = [SELECT lastName FROM Contact WHERE AccountId IN (SELECT id FROM Account WHERE Name = 'Pasha')];
        
        System.assertEquals(3, cont.size());        
    }
}