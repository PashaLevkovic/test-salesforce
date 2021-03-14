@isTest
public class TestVerifyDate {
	@isTest
    static void testCheckDates()
    {
        Date date1 = Date.today();
        Date date2 = Date.today() + 40;
        Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
        
        
        System.assertEquals(date1, VerifyDate.CheckDates(date1, date1));
        System.assertEquals(Date.newInstance(date1.year(), date1.month(), totalDays), VerifyDate.CheckDates(date1, date2));
    }
}