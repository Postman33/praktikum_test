const inputs=document.querySelectorAll('input')

for(let i=1;i<inputs.length;i+=6){
    inputs[i].oninput=()=>{
        const num=inputs[i].value;
        //inputs[i].style.color='white'
        inputs[i].style.textAlign='center'
        if(num<50) inputs[i].style.backgroundColor='red'
        else if(num<70) inputs[i].style.backgroundColor='yellow'
        else if(num<85) inputs[i].style.backgroundColor='#7fff00'
        else inputs[i].style.backgroundColor='green'
    }
}

function changeColor(inputs){
    for(let i=1;i<inputs.length;i+=6){
            const num=inputs[i].value;
            //inputs[i].style.color='white'
             inputs[i].style.textAlign='center'
            if(num<50) inputs[i].style.backgroundColor='red'
            else if(num<70) inputs[i].style.backgroundColor='yellow'
            else if(num<85) inputs[i].style.backgroundColor='#7fff00'
            else inputs[i].style.backgroundColor='green'
    }
}
changeColor(inputs)