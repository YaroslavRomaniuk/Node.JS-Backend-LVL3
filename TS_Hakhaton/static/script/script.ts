
enum PlusMinus {
    Plus,
    Minus
}

async function plusMinusFunction(currentSign: PlusMinus){
    let currentValue = "1";
    let myElement;
    if (currentSign === PlusMinus.Plus){
        await fetch("http://localhost:3005/", {
        method: "POST",
        body: JSON.stringify({
          button: "plus"
        }),
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        }
      })
        .then((response) => response.json())
        .then((json) =>  currentValue = "Plus: " + json.plus);
        if(document != null){
            
        }
        myElement = document.getElementById("plus");
        if (myElement != null){
            console.log(currentValue)
            myElement.innerHTML = currentValue
        }
    } else {
        await fetch("http://localhost:3005/", {
        method: "POST",
        body: JSON.stringify({
          button: "minus"
        }),
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        }
      })
        .then((response) => response.json())
        .then((json) =>  currentValue = "Minus: " + json.minus);
        if(document != null){
            
        }
        myElement = document.getElementById("minus");
        if (myElement != null){
            console.log(currentValue)
            myElement.innerHTML = currentValue
        }
    }
    
}


async function minusFunction(){
    
}