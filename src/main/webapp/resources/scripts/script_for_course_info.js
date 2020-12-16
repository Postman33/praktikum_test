
window.onload = function() {

    const clients = document.getElementById('elementId')
    const testbut = document.getElementById('testbut')
    const hidden_id = document.getElementById('hidden_id')
    const table = document.getElementById('super-table')


    testbut.onclick = () => {
        addTotable(table, clients)
    }
}
function getSelectedText( select ){
    var sel = document.getElementById(select);
    var index = sel.selectedIndex;
    return sel.options[index].text;
}
function getSelectedValue( select ){
    var sel = document.getElementById(select);
    var index = sel.options.selectedIndex;
    return sel.options[index].value;
}

function addTotable(table,clients) {
    const rowCount = table.rows.length;
    var row = table.insertRow(rowCount);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    const str=getSelectedText(clients).split('/')
    cell1.innerText=str[0]
    cell2.innerText=str[1]
    var element2 = document.createElement("input");
    element2.value=getSelectedValue(clients);
    element2.type = "hidden";
    element2.name="id2";
    cell1.appendChild(element2);
    var del_but = document.createElement("button");
    del_but.className="btn btn-danger"
    del_but.style="font-size: 16px;"
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