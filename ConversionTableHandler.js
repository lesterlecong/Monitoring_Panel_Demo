.pragma library

Qt.include("ConversionTableDBHandler.js");

function adcToCelcius(dbHandler, rollerNum, widgetNum, adcValue) {

    initDB();

    switch(widgetNum)
    {
        case 0:
            dbHandler.setTableName("roller_" + rollerNum.toString() + "_adc_to_celcius_1")
            break;
        case 1:
            dbHandler.setTableName("roller_" + rollerNum.toString() + "_adc_to_celcius_1")
            break;
        case 2:
            dbHandler.setTableName("roller_" + rollerNum.toString() + "_adc_to_celcius_1")
            break;
        default:
            break;
    }

    console.log("**Slope" + dbHandler.read("slope"))
    /*console.log("**Intercept:" + read("intercept"))*/

}
