const condition=document.getElementById('value')
const search=document.getElementById('search')
const table=document.querySelectorAll('td')
const update_buttons=document.getElementsByClassName('btn btn-info');
const delete_buttons=document.getElementsByClassName('btn btn-danger');
const but_show_all=document.getElementById('showAll')
console.dir(table)
search.onclick=()=>{
    const condit_text=condition.value.toLowerCase();
    console.log(condit_text)
    Search_for_template(table,condit_text,update_buttons,delete_buttons)
}
but_show_all.onclick=()=>{
    Show_all(table,update_buttons,delete_buttons)
    console.dir(table)
}


function Search_for_template(table,template,update_buttons,delete_buttons){
    let k=0
    for(let i=0;i<table.length;i+=2){
        if(table[i].innerText.toLowerCase()!==template){
            for(let j=i;j<i+2;j++){
                table[j].style.display='None'
                table[i].style.borderCollapse='collapse'
            }
            update_buttons[k].style.display='None'
            delete_buttons[k].style.display='None'
        }
        k+=1;
    }
}

function Show_all(table,update_buttons,delete_buttons){
    for(let i=0;i<table.length;i++){
        table[i].style.display='inline'
        table[i].style.marginLeft='15%'
    }
    for(let i=0;i<update_buttons.length;i++){
        update_buttons[i].style.display='inline'
        delete_buttons[i].style.display='inline'
    }
}