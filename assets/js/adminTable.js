var tableInfo = document.getElementById('dataTable_info');
var tableSelect = document.getElementById('dataTable_select');
tableSelect.onchange = function(){
   getJson(tableSelect.value);
};
var tbody = document.getElementById('dataTable').getElementsByTagName('tbody')[0];
function getJson(count,page){
$.getJSON("assets/php/getUsers.php", function(data) {
   tbody.innerHTML = '';
   var maxRead = 0;
   if(data.length < count){
      maxRead = data.length;
   }else{
      maxRead = count;
   }
for(var i = 0; i < maxRead;i++){
   var nRow = tbody.insertRow();
   //Cells
   var cells = [];
   for(var j = 0; j < 6; j++){
      cells.push(nRow.insertCell());
   }
   //Text
   var text = [];
   text.push(document.createTextNode(data[i].Username));
   text.push(document.createTextNode(data[i].Email));
   text.push(document.createTextNode(data[i].Vorname));
   text.push(document.createTextNode(data[i].Nachname));
   text.push(document.createTextNode('Germany'));
   text.push(document.createTextNode(data[i].Kontostand+'$'));
   for(var j = 0; j < 6; j++){
      cells[j].appendChild(text[j]);
   }
   tableInfo.innerHTML = "Showing 1 to "+maxRead+" of "+data.length;
}
 }).done(function() {
    console.log( "second success" );
 })
 .fail(function() {
   console.log( "getting json failed" );
 })
 .always(function() {
    console.log( "complete" );
 })};

 getJson(tableSelect.value,1);