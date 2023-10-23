import { LightningElement } from 'lwc';
import introJs from '@salesforce/resourceUrl/introJS';
import { loadScript } from 'lightning/platformResourceLoader';

export default class TooltipAppGuidance extends LightningElement {
    isRendered = false;

    renderedCallback() {
        if (this.isRendered) {
            return;
        }
        this.isRendered = true;

        Promise.all([
            loadScript(this, introJs + "/introJS.js")
          ]).then(() => {
            console.log('Loaded');
          });       
    }
}