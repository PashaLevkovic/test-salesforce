@isTest
public class TestRestrictContactByName {
	@isTest
    static void testContactByName()
    {
        Contact contact1 = new Contact(LastName = 'INVALIDNAME');
        Contact contact2 = new Contact(LastName = 'aaa');
        
        Test.startTest();
        insert contact1;
        insert contact2;
        Test.stopTest();
    }
}