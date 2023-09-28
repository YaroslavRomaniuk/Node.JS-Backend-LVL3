import express from 'express';



enum buttonsPlusMinus{
    Plus,
    Minus
}

const app = express();
app.use(express.static('static'));
app.use(express.json());

let counterPlus = 0;
let counterMinus = 0;
const port = 3005
enum PlusMinus{
  Plus,
  Minus
}
app.post('/', (req, res) => {
  console.log(req.body.button)
  if (req.body.button === "plus"){
    res.send(counter(PlusMinus.Plus));
  } else {
    res.send(counter(PlusMinus.Minus));
  }
})


app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
 

function counter (sign: PlusMinus) {
      if(sign === PlusMinus.Plus){
        counterPlus++;
        //console.log({plus:counterPlus});
        return {plus:counterPlus}
      } else {
        counterMinus++
        //console.log({plus:counterMinus})
        return {minus:counterMinus}
      }
}