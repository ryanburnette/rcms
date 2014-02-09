$.fn.setNow = function (onlyBlank) {
  var now = new Date($.now())
    , year
    , month
    , day
    , hours
    , minutes
    , seconds
    , formattedDateTime
    ;
  
  year = now.getFullYear();
  month = now.getMonth().toString().length === 1 ? '0' + (now.getMonth() + 1).toString() : now.getMonth() + 1;
  day = now.getDay().toString().length === 1 ? '0' + (now.getDay() + 1).toString() : now.getDay() + 1;
  hours = now.getHours().toString().length === 1 ? '0' + now.getHours().toString() : now.getHours();
  minutes = now.getMinutes().toString().length === 1 ? '0' + now.getMinutes().toString() : now.getMinutes();
  seconds = now.getSeconds().toString().length === 1 ? '0' + now.getSeconds().toString() : now.getSeconds();
  
  // seconds needs to be 0
  seconds = '00';

  formattedDateTime = year + '-' + month + '-' + day + 'T' + hours + ':' + minutes + ':' + seconds;
 
  if ( onlyBlank === true && $(this).val() ) {
    return this;
  }
  
  $(this).val(formattedDateTime);
  
  return this;
}