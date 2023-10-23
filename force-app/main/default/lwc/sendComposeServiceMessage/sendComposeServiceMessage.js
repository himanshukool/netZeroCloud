import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class SendComposeServiceMessage extends NavigationMixin(LightningElement){
    emailBody = '';
    emailSubject = '';
    additionalEmails = '';

    selectedContactRecords = null;
    selectedContactRecordsLength = 0;

    selectedUserRecords = null;
    selectedUserRecordsLength = 0;

    OWDemailRecord = null;
    OWDemailRecordAddress = '';

    handleChange() {
        
    }

    handleselectedContactRecords(event){
        this.selectedContactRecords = [...event.detail.selRecords];
        this.selectedContactRecordsLength = this.selectedContactRecords.length;
    }

    handleselectedUserRecords(event){
        this.selectedUserRecords = [...event.detail.selRecords];
        this.selectedUserRecordsLength = this.selectedUserRecords.length;
    }

    handleselectedContactRecordsCC(event){

    }

    handleselectedUserRecordsCC(event){

    }

    handleselectedContactRecordsBCC(event){

    }

    handleselectedUserRecordsBCC(event){

    }

    handleValueSelectedOnOWEAddress(event){
        this.OWDemailRecord = event.detail;
        this.OWDemailRecordAddress = this.contactSelectedRecord.Address;
    }

    handleDeselectOnOWEAddress(event){
        this.OWDemailRecord = event.detail;
        this.OWDemailRecordAddress = null;
    }

    handleValueSelectedOnEmailTemplate(event){

    }

    handleDeselectOnEmailTemplate(event){
        
    }

    get acceptedFormats(){
        return ['.pdf', '.png', '.jpg' , '.jpeg'];
    }

    handleUploadFinished(event){
        const uploadedFiles = event.detail.files;
        console.log('Uploaded files: '+ uploadedFiles);
        console.log('Uploaded files count: '+ uploadedFiles.length);
    }

    handleNotify(event){
        
    }

    handleRefresh(event){
        window.location.reload();
    }
}