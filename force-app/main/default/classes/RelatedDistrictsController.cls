public with sharing class RelatedDistrictsController
{
    @AuraEnabled
    public static List<District__c> getDistricts(Id regionId)
    {
        return [
            SELECT Name, Population__c, Area__c
            FROM District__c
            WHERE Region__c = : regionId
            ORDER BY Name
        ];
    }
}