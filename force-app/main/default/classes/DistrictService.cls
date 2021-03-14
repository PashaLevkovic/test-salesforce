public class DistrictService
{
    public static void countPopulationAndArea(List<District__c> districts)
    {
        Set<Id> regionsIds = new Set<Id>();
        for (District__c district : districts)
        {
            regionsIds.add(district.Region__c);
        }

        List<AggregateResult> aggregateResults = [
            SELECT Region__c, SUM(Population__c) population, SUM(Area__c) area
            FROM District__c
            WHERE Region__c IN : regionsIds
            GROUP BY Region__c
        ];

        List<Region__c> regions = [
            SELECT Population__c, Area__c
            FROM Region__c
            WHERE Id IN : regionsIds
        ];

        Map<Id, City__c> cities = new Map<Id, City__c>();

        for(City__c city : [SELECT Id, Population__c, Region__c FROM City__c WHERE Region__c IN : regionsIds]){
            cities.put(city.Region__c, city);
        }

        for (Region__c region : regions)
        {
            for (AggregateResult result : aggregateResults)
            {
                if (region.Id == result.get('Region__c'))
                {
                    region.Population__c = cities.get(region.Id).Population__c + (Decimal)result.get('population');
                    region.Area__c = (Decimal)result.get('area');
                }
            }
        }

        update regions;
    }
}