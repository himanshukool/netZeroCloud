public without sharing class DescribeObjectData {
    
	public static void getObjFieldsData(String objectApiName){
        Boolean successOrFail = false;
        List<ContentVersion> insertContentList = new List<ContentVersion>();
        
        List<String> objectNames = new List<String>();      
        objectNames.add(objectApiName);
        
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();

        Map<String, Map<String, Schema.SObjectField>> globalFieldMap = new Map<String, Map<String, Schema.SObjectField>>();
         
        for(String SobjectApiName : objectNames){
            Map<String, Map<String, Schema.SObjectField>> objNameToFieldMap = new Map<String, Map<String, Schema.SObjectField>>();
            Map<String, Schema.SObjectField> objectFieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();
            objNameToFieldMap.put(SobjectApiName, objectFieldMap);
            globalFieldMap.putAll(objNameToFieldMap);
        }
         
        String csvContentString ='Object,Field Label,Field API Name,Type,isCustomField,Length\n';
        String fileRow = '';
        
        for(String objName : globalFieldMap.keyset()){
            Map<String, Schema.SObjectField> fieldMap = globalFieldMap.get(objName);
            for(Schema.SObjectField field : fieldMap.values()){
                Schema.DescribeFieldResult fd = field.getDescribe();
                fileRow = '';
                fileRow = fileRow +','+ objName;
                fileRow = fileRow +','+ field.getDescribe().getLabel();
                fileRow = fileRow +','+ field.getDescribe().getName();
                fileRow = fileRow +','+ field.getDescribe().getType();
                fileRow = fileRow +','+ field.getDescribe().getInlineHelpText();
                fileRow = fileRow +','+ field.getDescribe().getLength();
                fileRow = fileRow.replaceFirst(',','');
				csvContentString = csvContentString + fileRow + '\n';
            }
        }
        
        ContentVersion newCSVFile = new ContentVersion();
        newCSVFile.title = objectApiName + ' ' +'Fields Data - '+ UserInfo.getName() +' - '+System.now();
        newCSVFile.VersionData = Blob.valueOf(csvContentString);
        newCSVFile.PathOnClient = newCSVFile.title +'.csv';
        insert newCSVFile;
    }
}