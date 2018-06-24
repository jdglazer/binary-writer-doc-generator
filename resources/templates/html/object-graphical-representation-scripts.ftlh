<script type="text/javascript">
window.onload = function() {
    var withNoBorderRight = document.getElementsByClassName("${noBorderRightClass}");
    var withNoBorderLeft = document.getElementsByClassName("${noBorderLeftClass}");
    
    for( var i = 0; i < withNoBorderRight.length; i++ ) {
        withNoBorderRight[i].addEventListener("mouseover", function() {
            this.style = "${graphicalHoverStyle}";
            this.parentElement.nextElementSibling.firstElementChild.style = "${graphicalHoverStyle}";
        } )
        
        withNoBorderRight[i].addEventListener("mouseleave", function() {
            this.style = "background-color: #ffffff;"
            this.parentElement.nextElementSibling.firstElementChild.style = "background-color: #ffffff;";
        } )
    }
    
    for( var i = 0; i < withNoBorderLeft.length; i++ ) {
        withNoBorderLeft[i].addEventListener("mouseover", function() {
            this.style = "${graphicalHoverStyle}";
            this.parentElement.previousElementSibling.lastElementChild.style = "${graphicalHoverStyle}";
        } )
        
        withNoBorderLeft[i].addEventListener("mouseleave", function() {
            this.style = "background-color: #ffffff;"
            this.parentElement.previousElementSibling.lastElementChild.style = "background-color: #ffffff;";
        } )
    }
}
</script>
