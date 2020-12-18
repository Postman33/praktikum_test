const inputs=document.querySelectorAll('input')

for(let i=1;i<inputs.length;i+=6){
    inputs[i].oninput=()=>{
        const num=inputs[i].value;
        //inputs[i].style.color='white'
        inputs[i].style.textAlign='center'
        if(num<50) inputs[i].style.backgroundColor='#e05053'
        else if(num<70) inputs[i].style.backgroundColor='#f1e35f'
        else if(num<85) inputs[i].style.backgroundColor='#8fbc5d'
        else inputs[i].style.backgroundColor='#85ff00'
    }
}

function changeColor(inputs){
    for(let i=1;i<inputs.length;i+=6){
            const num=inputs[i].value;
            //inputs[i].style.color='white'
             inputs[i].style.textAlign='center'
        if(num<50) inputs[i].style.backgroundColor='#e05053'
        else if(num<70) inputs[i].style.backgroundColor='#f1e35f'
        else if(num<85) inputs[i].style.backgroundColor='#8fbc5d'
        else inputs[i].style.backgroundColor='#85ff00'
    }
}
changeColor(inputs)