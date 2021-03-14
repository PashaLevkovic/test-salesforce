public class soqlTask {
    List<Contact> first = [SELECT id, name FROM Contact WHERE Account.Name = 'Edge Communications'];
    
    List<AggregateResult> second = [SELECT Account.Name, AVG(Amount) FROM Opportunity 
                                    WHERE Account.Name = 'Edge Communications' GROUP BY Account.Name];
    
    List<Account> third = [SELECT Id, Name FROM Account WHERE Id IN (SELECT AccountId From Contact WHERE LastName ='fra%')
                           AND Id IN (SELECT AccountId FROM Opportunity WHERE StageName != 'Close Won')];
    
	List<AggregateResult> fourth = [SELECT Account.id FROM Contact GROUP BY Account.id HAVING COUNT(Id) > 2];
    
    List<Account> fifth = [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Contact)];
    
    List<AggregateResult> sixth = [SELECT LeadSource, COUNT(Name) FROM Lead GROUP BY ROLLUP(LeadSource)];
    
    List<AggregateResult> seventh = [SELECT COUNT(Id) FROM Account WHERE Billingstate='CA' OR Billingstate='TX'];
    
}