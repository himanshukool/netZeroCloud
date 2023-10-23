import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import GETOBJECTNAME from '@salesforce/apex/GetObjectNames.getObjectsNamesFromOrg';
import CREATECSV from '@salesforce/apex/GetObjectNames.generateCSV';

export default class CreateObjectDetailsCSV extends LightningElement {
    @track error;

    @track value;
    @track options = [
        {value: 'None', label: 'None'}
    ];

    connectedCallback(){
        GETOBJECTNAME()
            .then(result => {
                var conts = result;
                for(const list of result){
                    const option = {
                        label: list,
                        value: list
                    };
                    this.options = [ ...this.options, option ];
                }
            })
            .catch(error => {
                this.error = error;
                console.log('Error is: '+error);
            });
    }

    handleChange(event){
        this.value = event.detail.value;
    }

    handleClick(event){
        console.log('Trust the process: '+this.value);
        if(this.value == null || this.value == undefined || this.value == 'None'){
            let toast = new ShowToastEvent({
                title: 'Select an object.',
                message: 'Please select an object first from the above dropdowm.',
                variant: 'warning'
            });
            this.dispatchEvent(toast);
        }else{
            CREATECSV({ objectApiName: this.value })
                .then(result => {
                    console.log('Test result --> '+ result);
                    let toast = new ShowToastEvent({
                        title: 'CSV generated',
                        message: 'CSV is getting generated under files in lightning.',
                        variant: 'success'
                    });
                    this.dispatchEvent(toast);
                })
                .catch(error => {
                    this.error = error;
                    console.log('Error in CSV generation is: '+error);
                });
        }
    }
}