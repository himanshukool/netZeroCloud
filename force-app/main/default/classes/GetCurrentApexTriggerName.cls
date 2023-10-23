public class GetCurrentApexTriggerName {
    public static void getApexTriggerDetails(List<sObject> dataList){
        SObjectType triggerType = dataList.getSObjectType();
        String objectName = String.valueOf(triggerType);
        System.debug('Trigger Type: '+ triggerType);
        List<ApexTrigger> triggerDetails = [SELECT Name, TableEnumOrId, ApiVersion, Status, CreatedDate FROM ApexTrigger WHERE TableEnumOrId =:objectName];
        System.debug('Trigger details: '+ triggerDetails);

    }
}