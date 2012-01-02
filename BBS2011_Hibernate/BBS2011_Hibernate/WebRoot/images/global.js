/*
 * $RCSfile: global.js,v $
 * $Revision: 1.1 $
 * $Date: 2011/08/15 05:44:14 $
 *
 * Copyright (C) 1999-2004 Jive Software. All rights reserved.
 *
 * This software is the proprietary information of Jive Software. Use is subject to license terms.
 */

/*
 * Returns a page element by its id in a non browser specific way.
 */
function getEl(id) {
    if (document.layers) { return document.layers[id]; }
    else if (document.all) { return document.all[id]; }
    else if (document.getElementById) { return document.getElementById(id); }
}
function openWin(url) {
    var win = window.open(url,'newWindow','width=450,height=400,menubar=yes,location=no,statusbar=yes,personalbar=no,scrollbars=yes,resize=yes');
}