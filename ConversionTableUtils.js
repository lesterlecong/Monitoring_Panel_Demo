.pragma library

function slope(x1, x2, y1, y2) {
    console.log("Computing slope(")
    /***Note:****
    /* y = mx + b
    /* m = (y2 - y1)/(x2 - x1); where x2 must not be equal to x1.
    */

    if(x1 === x2) {
        return 0;
    }

    var slope = (y2-y1)/(x2-x1);
    console.log("Slope value: " + slope)
    return slope;
}

function intercept(x, y, slope) {
    /***Note:****
    /* y = mx + b
    /* b = y - mx
    */

    var b = y - (slope*x);
    return b;
}

function newX(y, slope, intercept) {
    var x = (intercept-y)/slope;
    return x;
}

function newY(x, slope, intercept) {
    var y = (slope*x) + intercept;
    return y;
}
