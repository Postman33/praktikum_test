const condition=document.getElementById('value')
const search=document.getElementById('search')
const table=document.querySelectorAll('td')
const update_buttons=document.getElementsByClassName('btn btn-info');
const delete_buttons=document.getElementsByClassName('btn btn-danger');
const but_show_all=document.getElementById('showAll')
const elements=document.getElementsByClassName('elements')
console.dir(elements)


condition.oninput=()=>{
    const str=this.value.value.toLowerCase();
    console.log(str)
    if(str!=''){
        Search_for_template(table,elements,str)
    }
    else{
        Show_all(table,elements)
    }

}

search.onclick=()=>{
    const condit_text=condition.value.toLowerCase();
    if(condit_text!='')
    Search_for_template(table,elements,condit_text)
}
but_show_all.onclick=()=>{
    Show_all(table,elements)
}


function Search_for_template(table,elements,template){
    let k=0;
    for(let i=0;i<table.length;i+=2){
        if(table[i].innerText.toLowerCase().search(template)==-1){
            elements[k].style.display='None'
            table[i].innerHTML=table[i].innerText;
    }
        else{
            const sub=table[i].innerText;
            table[i].innerHTML=insertMark(sub,sub.toLowerCase().search(template),template.length)
        }
        k+=1;
    }
}

function Show_all(table,elements){
    let k=0;
for(let i=0;i<table.length;i+=2){
    elements[k].style.display=''
    table[i].innerHTML=table[i].innerText;
    k++;
}
}

function insertMark(str, pos,len){
    return str.slice(0,pos)+'<mark>'+str.slice(pos,pos+len)+'</mark>'+str.slice(pos+len);
}