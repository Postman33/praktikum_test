const tab_elements=document.querySelectorAll('input')
const table_ser=document.getElementById('tab_ser')
const add_but=document.getElementById('add_but')
console.dir(tab_elements)
console.dir(table_ser)
add_but.onclick=()=>{
    add(tab_elements,table_ser)
}

function add(tab_elements,table_ser){
    var element1 = document.createElement("input");
    element1.value=tab_elements[3].value
    element1.type='text'

    var element2 = document.createElement("input");
    element2.value=tab_elements[4].value
    element2.type='number'

    var element3 = document.createElement("input");
    element3.value=tab_elements[5].value
    element3.type='date'

    var del_but = document.createElement("button");
    del_but.onclick=()=>{
        del_but.parentElement.closest('tr').remove()
    }
    del_but.type = "button";
    del_but.textContent='Delete'


    const rowCount = table_ser.rows.length;
    var row = table_ser.insertRow(rowCount);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);

    cell1.appendChild(element1)
    cell2.appendChild(element2)
    cell3.appendChild(element3)
    cell4.appendChild(del_but)
}