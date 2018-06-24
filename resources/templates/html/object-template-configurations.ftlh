<#-- Where we assign things that we would like to be configurable for the 
     object template view and all the subviews that make it up  -->
<#assign noBorderLeftClass="no-border-left"
         noBorderRightClass="no-border-right">
         
<#if !graphicalHoverStyle?? >
    <#assign graphicalHoverStyle = "background-color: #f2f2f2;" >
</#if>