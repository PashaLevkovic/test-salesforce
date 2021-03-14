public with sharing class TablePageController
{
    @AuraEnabled
    public static List<WrapperClass> getCities()
    {
        List<City__c> cities = [
            SELECT Name, Population__c, Region__r.Name, Region__r.Population__c, Region__r.Area__c
            FROM City__c
            ORDER BY Region__r.Name
        ];

        List<AggregateResult> numberOfDistricts = [
            SELECT Region__r.Name, COUNT(Id) districts
            FROM District__c
            GROUP BY Region__r.Name
        ];

        List<WrapperClass> results = new List<WrapperClass>();

        for (Integer i = 0; i < cities.size(); i++)
        {
            results.add(new WrapperClass(cities[i], (Integer)numberOfDistricts[i].get('districts')));
        }

        for (Integer i = 0; i < results.size(); i++)
        {
            System.debug(results[i]);
        }

        return results;

    }

    public class WrapperClass
    {
        @AuraEnabled
        public City__c city;
        @AuraEnabled
        public Integer numberOfDistricts;


        public WrapperClass(City__c city, Integer numberOfDistricts)
        {
            this.city = city;
            this.numberOfDistricts = numberOfDistricts;
        }
    }
}