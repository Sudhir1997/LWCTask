import { LightningElement,wire,track } from 'lwc';
import getLead from '@salesforce/apex/Pidi_getRecords.getLeads';
export default class LeadLists extends LightningElement {
columns = [
        { label: 'Name', fieldName: 'Name',editable: true  },
        { label: 'Company', fieldName: 'Company' },
        { label: 'Email', fieldName: 'Email' },
        { label: 'Status', fieldName: 'Status' },
    ];
@track leadRec=[];
@wire(getLead)
getLead({data,error}){
    if(data)
    {
        console.log(data);
        this.leadRec=data;
    }
    if(error)
    {
        console.log(error);
        
    }
}

}
