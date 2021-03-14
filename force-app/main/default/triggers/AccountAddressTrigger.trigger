trigger AccountAddressTrigger on Account (before insert, before update) {
	if (Trigger.isInsert || Trigger.isUpdate) 
    {
        if (Trigger.isBefore)
        {
            for (Account acc : Trigger.New) 
            {
                if (acc.Match_Billing_Address__c == true)
                {
                    acc.ShippingPostalCode = acc.BillingPostalCode;
                }
            }
        }
    }
}