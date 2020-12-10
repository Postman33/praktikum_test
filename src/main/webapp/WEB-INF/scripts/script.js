const condition=document.getElementById('value')
const search=document.getElementById('search')
const table=document.querySelectorAll('td')
const update_buttons=document.getElementsByClassName('btn btn-info');
const delete_buttons=document.getElementsByClassName('btn btn-danger');
const but_show_all=document.getElementById('showAll')
const elements=document.getElementsByClassName('elements')
console.dir(elements)

search.onclick=()=>{
    const condit_text=condition.value.toLowerCase();
    Search_for_template(table,elements,condit_text)
}
but_show_all.onclick=()=>{
    Show_all(elements)
}


function Search_for_template(table,elements,template){
    let k=0;
    for(let i=0;i<table.length;i+=2){
        if(table[i].innerText.toLowerCase()!==template){
            elements[k].style.visibility='collapse'
    }
        k+=1;
    }
}

function Show_all(elements){
for(let i=0;i<elements.length;i++){
    elements[i].style.visibility='visible'

}
}