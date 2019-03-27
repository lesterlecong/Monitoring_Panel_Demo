Qt.include("ConversionTableUtils.js");

function dbGetHandle()
{
    try {
        var db = LocalStorage.openDatabaseSync("ConversionTableDB", "1.0", "Conversion Table Database", 1000000)
    } catch (err) {
        console.log("Error opening database: " + err)
    }
    return db
}

function ConversionTableDBHandler() {
    this.unitMinDefaultValue1 = 0;
    this.unitMaxDefaultValue1 = 0;
    this.unitMinDefaultValue2 = 0;
    this.unitMaxDefaultValue2 = 0;

    this.unitMinType1 = "INTEGER";
    this.unitMaxType1 = "INTEGER";
    this.unitMinType2 = "DEC(10, 2)";
    this.unitMaxType2 = "DEC(10, 2)";

    this.tableName = "DefaultName";
}

ConversionTableDBHandler.prototype.table = function(name) {
    this.tableName = name
}

ConversionTableDBHandler.prototype.defaultType = function(unitMin1, unitMax1, unitMin2, unitMax2) {
    this.unitMinType1 = unitMin1;
    this.unitMaxType1 = unitMax1;
    this.unitMinType2 = unitMin2;
    this.unitMaxType2 = unitMax2;
}

ConversionTableDBHandler.prototype.defaultValue = function(unitMin1, unitMax1, unitMin2, unitMax2) {
    this.unitMinDefaultValue1 = unitMin1;
    this.unitMaxDefaultValue1 = unitMax1;
    this.unitMinDefaultValue2 = unitMin2;
    this.unitMaxDefaultValue2 = unitMax2;
}

ConversionTableDBHandler.prototype.initDB = function() {

    var db = dbGetHandle();
    var table = this.table;
    var minType1 = this.unitMinType1;
    var maxType1 = this.unitMaxType1;
    var minType2 = this.unitMinType2;
    var maxType2 = this.unitMaxType2;
    var minValue1 = this.unitMinValue1;
    var maxValue1 = this.unitMaxValue1;
    var minValue2 = this.unitMinValue2;
    var maxValue2 = this.unitMaxValue2;



    /*
    try {
        db.transaction(
           function(tx){
               var command = 'CREATE TABLE IF NOT EXISTS '+ conversionTableDB.tableName +
                             '(unit_1_min '  + this.unitMinType1  + ' DEFAULT ' + this.unitMinDefaultValue1.toString() + ' , ' +
                             'unit_1_max '   + this.unitMaxType1  + ' DEFAULT ' + this.unitMaxDefaultValue1.toString() + ' , ' +
                             'unit_2_min '   + this.unitMinType2  + ' DEFAULT ' + this.unitMinDefaultValue2.toString() + ' , ' +
                             'unit_2_max '   + this.unitMaxType2  + ' DEFAULT ' + this.unitMaxDefaultValue2.toString() + ' , ' +
                             'slope DEC(10,2) DEFAULT 0, intercept DEC(10,2) DEFAULT 0)'

                console.log("Create Table command: " + command)

           });
    } catch(err) {
        console.log("Error accessing database: " + err)
    }*/
}

var conversionTableDB = [];

function initDB() {
    conversionTableDB = new ConversionTableDBHandler();
}

function setTableName(name) {
    conversionTableDB.table(name);
}

function setDefaultValue(unit_1_min, unit_1_max, unit_2_min, unit_2_max) {
    conversionTableDB.defaultValue(unit_1_min, unit_1_max, unit_2_min, unit_2_max);
}

function setDefaultType(unit_1_min, unit_1_max, unit_2_min, unit_2_max) {
    conversionTableDB.defaultType(unit_1_min, unit_1_max, unit_2_min, unit_2_max);
}

function startDB() {
    var db = dbGetHandle()
    try {
        db.transaction(
           function(tx){
                var command = 'CREATE TABLE IF NOT EXISTS '+ conversionTableDB.tableName +
                             '(unit_1_min '  + conversionTableDB.unitMinType1  + ' DEFAULT ' + conversionTableDB.unitMinDefaultValue1 + ' , ' +
                             'unit_1_max '   + conversionTableDB.unitMaxType1  + ' DEFAULT ' + conversionTableDB.unitMaxDefaultValue1 + ' , ' +
                             'unit_2_min '   + conversionTableDB.unitMinType2  + ' DEFAULT ' + conversionTableDB.unitMinDefaultValue2 + ' , ' +
                             'unit_2_max '   + conversionTableDB.unitMaxType2  + ' DEFAULT ' + conversionTableDB.unitMaxDefaultValue2 + ' , ' +
                             'slope DEC(10,2) DEFAULT 0, intercept DEC(10,2) DEFAULT 0)'

                console.log("Create Table command: " + command)
                tx.executeSql(command);


                var check_count = readAll()
                if(check_count.rows.length === 0) {
                   insert(conversionTableDB.unitMinDefaultValue1,
                          conversionTableDB.unitMaxDefaultValue1,
                          conversionTableDB.unitMinDefaultValue2,
                          conversionTableDB.unitMaxDefaultValue2,
                          0,
                          0
                          )
               }

               var result = readAll()

               for(var i = 0; i < result.rows.length; i++) {
                   console.log("unit 1 min value:" + result.rows.item(i).unit_1_min)
                   console.log("unit 1 max value:" + result.rows.item(i).unit_1_max)
                   console.log("unit 2 min value:" + result.rows.item(i).unit_2_min)
                   console.log("unit 2 max value:" + result.rows.item(i).unit_2_max)

                   console.log("slope:" + result.rows.item(i).slope)
                   console.log("intercept:" + result.rows.item(i).intercept)
               }

           })
    }
    catch(err) {
            console.log("Error accessing database: " + err)
        }

}

function insert(unitMin1, unitMax1, unitMin2, unitMax2, slope, intercept) {
    var db = dbGetHandle()
    try {
        db.transaction(
           function(tx){
               var command = 'INSERT INTO ' +  conversionTableDB.tableName +
                       ' VALUES(' +
                       unitMin1.toString() + ' , ' +
                       unitMax1.toString() + ' , ' +
                       unitMin2.toString() + ' , ' +
                       unitMax2.toString() + ' , ' +
                       slope.toString()    + ' , ' +
                       intercept.toString() + ')'

               console.log("Insert command: " + command)
               tx.executeSql(command);
            });
    }catch(err) {
        console.log("Error accessing database: " + err)
    }
}

function update(unitMin1, unitMax1, unitMin2, unitMax2, slope, intercept) {
    var db = dbGetHandle()
    try {
        db.transaction(
           function(tx){
               var command = 'UPDATE ' + conversionTableDB.tableName + ' SET ' +
                             'unit_1_min = ' + unitMin1.toString() + ' , ' +
                             'unit_1_max = ' + unitMax1.toString() + ' , ' +
                             'unit_2_min = ' + unitMin2.toString() + ' , ' +
                             'unit_2_max = ' + unitMax2.toString() + ' , ' +
                             'slope = ' + slope.toString() + ' , ' +
                             'intercept = ' + intercept.toString()

               console.log("Update command: " + command)

               tx.executeSql(command)
           }
        )
    }
    catch(err) {
                    console.log("Error accessing database: " + err)
                }
}

function read(columnName) {
    var db = dbGetHandle()
    var result = []
    try {
        db.transaction(
            function(tx) {
                var command = 'SELECT ' + columnName + ' FROM ' + conversionTableDB.tableName
                console.log("Select command:" + command)
                result = tx.executeSql(command)
            }

        )
    }
    catch(err) {
                    console.log("Error accessing database: " + err)
                }

    return result
}

function readAll() {
    var db = dbGetHandle()
    var result = []
    try {
        db.transaction(
            function(tx) {
                var command = 'SELECT * FROM ' + conversionTableDB.tableName
                result = tx.executeSql(command)
            }

        )
    }
    catch(err) {
                    console.log("Error accessing database: " + err)
                }

    return result
}

function adcToCelcius(adcValue) {
    //console.log("***Slope" + read("slope").rows.item(0).slope)
    //console.log("***Intercept" + read("slope").rows.item(0).intercept)

    return newY(adcValue, 0.09775, 0)
}

function adcToRPM(adcValue) {
    return newY(adcValue, 0.293255132, 0)
}

function adcToBatteryLevel(adcValue) {
    return newY(adcValue, 0.09775, 0)
}


