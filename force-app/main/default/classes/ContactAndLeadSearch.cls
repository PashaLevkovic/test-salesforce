public class ContactAndLeadSearch 
{
    public static List<List<SObject>> searchContactsAndLeads (String str)
    {
        return [FIND 'Smith' IN ALL FIELDS RETURNING Lead(FirstName, LastName), Contact(FirstName, LastName)];
    }

}