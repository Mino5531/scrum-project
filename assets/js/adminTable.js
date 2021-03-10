var tableInfo = document.getElementById('dataTable_info');
var paginator = document.getElementById('paginator')
var tableSelect = document.getElementById('dataTable_select');
var GET = {};
if(document.location.toString().indexOf('?') !== -1) {
    var query = document.location
                   .toString()
                   .replace(/^.*?\?/, '')
                   .replace(/#.*$/, '')
                   .split('&');

    for(var i=0, l=query.length; i<l; i++) {
       var aux = decodeURIComponent(query[i]).split('=');
       GET[aux[0]] = aux[1];
    }
}
var page;
 page = GET["page"];
 if(page == undefined){
    page = 0;
 }
 console.log(page);
tableSelect.onchange = function(){
   getJson(tableSelect.value);
};
var tbody = document.getElementById('dataTable').getElementsByTagName('tbody')[0];
function getJson(count,page){
$.getJSON("assets/php/getUsers.php", function(data) {
   tbody.innerHTML = '';
   var maxRead = 0;
   if(data.length < +count+(+page*+count)){
      maxRead = data.length;
   }else{
      maxRead = +count+(+page*+count);
   }
for(var i = 0+(page*count); i < maxRead;i++){
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
var pagecount = Math.floor(data.length / count);
console.log(pagecount)
if (data.length%count != 0){
   pagecount++;
}
paginator.innerHTML = '';
for(var i=0;i<pagecount;i++){
   var li = document.createElement("li");
   li.classList.add("page-item");
   if(page == i){
      li.classList.add("active");
   }
   var a = document.createElement("a");
   a.classList.add("page-link");
   a.innerText = i+1;
   a.href = "table.html?page="+i;
   li.appendChild(a);
   paginator.appendChild(li);
}
 }).done(function() {
    console.log( "second success" );
 })
 .fail(function() {
   console.log( "getting json failed" );
   alert("JSON Error");
 })
 .always(function() {
    console.log( "complete" );
 })};
getJson(tableSelect.value,page);