import SmartTable from 'sap/ui/comp/smarttable/SmartTable';
import Controller from 'sap/ui/core/mvc/Controller';
import ODataModel from 'sap/ui/model/odata/v2/ODataModel';
import Table from 'sap/ui/table/Table';

/**
 * @namespace com.starwars.fighter.controller
 */
export default class MainView extends Controller {
  /*eslint-disable @typescript-eslint/no-empty-function*/
  public onInit(): void {
  }

  public onRefreshTable(): void {
    const smartTable = this.byId('smartTable') as SmartTable;
    const innerTable = smartTable.getTable() as Table;
    innerTable.getBinding('rows').refresh();
  }

  public onFieldChange(): void {
    const smartTable = this.byId('smartTable') as SmartTable;
    const innerTable = smartTable.getTable() as Table;
    const model = smartTable.getModel() as ODataModel;
    model.submitChanges();
  }

  public async onSubmitChanges(): Promise<void> {
    const smartTable = this.byId('smartTable') as SmartTable;
    const innerTable = smartTable.getTable() as Table;
    const model = smartTable.getModel() as ODataModel;
    model.submitChanges();
  }
}
