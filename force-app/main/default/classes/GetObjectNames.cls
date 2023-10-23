public without sharing class GetObjectNames {

    @AuraEnabled(cacheable=true)
    public static List<String> getObjectsNamesFromOrg(){
        List<String> objectApiNamesList = new List<String>();
        Map<String, Schema.sObjectType> allObjectsMap = new Map<String, Schema.sObjectType>();
        allObjectsMap = Schema.getGlobalDescribe();
        for(String r: allObjectsMap.keySet()){
            objectApiNamesList.add(r.toUppercase());
        }
        objectApiNamesList.sort();
        return objectApiNamesList;
    }

    @AuraEnabled
    public static void generateCSV(String objectApiName){
        DescribeObjectData.getObjFieldsData(objectApiName);
    }
}