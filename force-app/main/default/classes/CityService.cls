public class CityService
{
    public static void countPopulation(List<City__c> cities)
    {
        Map<Id, City__c> idByCity = new Map<Id, City__c>();
        for (City__c city : cities)
        {
            idByCity.put(city.Region__c, city);
        }
        List<AggregateResult> aggregateResults = [
            SELECT Region__c, SUM(Population__c) population
            FROM District__c
            WHERE Region__c IN : idByCity.keySet()
            GROUP BY Region__c
        ];

        List<Region__c> regions = [
            SELECT Population__c
            FROM Region__c
            WHERE Id IN : idByCity.keySet()
        ];

        for (Region__c region : regions)
        {
            for (AggregateResult result : aggregateResults)
            {
                if (region.Id == result.get('Region__c'))
                {
                    if (result.get('population') != null)
                    {
                        region.Population__c = (Decimal)result.get('population') + idByCity.get(region.Id).Population__c;
                    }
                    else
                    {
                        region.Population__c = idByCity.get(region.Id).Population__c;
                    }
                }
            }
        }

        update regions;
    }
}