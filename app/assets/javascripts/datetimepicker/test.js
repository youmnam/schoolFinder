


$(document).ready(function() {
  jQuery(function(){
 jQuery('#from').datetimepicker({
  format:'Y-m-d',
  minDate:'0',
  onShow:function( ct ){
   this.setOptions({
    maxDate:jQuery('#to').val()?jQuery('to').val():false
   })
  },
  timepicker:false
 });
 jQuery('#to').datetimepicker({
  format:'Y-m-d',
  onShow:function( ct ){
   this.setOptions({
    minDate:jQuery('#from').val()?jQuery('#from').val():false
   })
  },
  timepicker:false
 });
});
   
});