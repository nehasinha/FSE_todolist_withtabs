// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
        $("#task_date").datepicker({
            dateFormat: "yy-mm-dd"
        });
});

$(function(){
   $("#tasks th a, #tasks .pagination a").live("click", function(){
       $.getScript(this.href);
       return false;
   });
    $("#tasks_search input").keyup(function(){
       $.get($("#tasks_search").attr("action"), $("#tasks_search").serialize(),null, "script");
       return false;
    });


});


