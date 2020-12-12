const clients=document.getElementById('sel')
const testbut=document.getElementById('testbut')
const hidden_id=document.getElementById('hidden_id')
const table=document.getElementById('super-table')

testbut.onclick=()=> {
    addTotable(table,clients)
}

function addTotable(table,clients){
    const val=clients.value;
    const rowCount = table.rows.length;
    var row = table.insertRow(rowCount);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    const str=clients[val-1].innerText.split('/')
    cell1.innerText=str[0]
    cell2.innerText=str[1]
    var element2 = document.createElement("input");
    element2.value=val;
    element2.type = "hidden";
    element2.name="id2";
    cell1.appendChild(element2);
    var del_but = document.createElement("button");
    del_but.onclick=()=>{
        del_but.parentElement.closest('tr').remove()
    }
    del_but.type = "button";
    del_but.textContent='Delete'
    cell3.appendChild(del_but)
}
function DeleteRow( el ){
    el.parentElement.closest('tr').remove();
}