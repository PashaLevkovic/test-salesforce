public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer quantity, String name)
    {
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < quantity; i++)
        {
            contacts.add(new Contact(FirstName = name + i));
        }
        return contacts;
    }
}