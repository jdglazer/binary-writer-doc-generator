<style>
    table#graphical {
        table-layout:fixed;
        width:100%; 
        border-collapse: collapse; 
        border-spacing:0;
    }
    table#graphical td {
        border: 1px solid black;
        text-align: center;
        overflow: hidden;
        white-space: nowrap;
    }
    table#graphical tr {
        height: 20px;
    }
    table#graphical td:hover {
        ${graphicalHoverStyle}
    }
    table#graphical td.${noBorderRightClass} {
        border-right: 0px;
    }
    
    table#graphical td.${noBorderLeftClass} {
        border-left: 0px;
    }
</style>
