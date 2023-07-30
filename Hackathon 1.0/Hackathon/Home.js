let accounts;
window.onload = function()
{
    console.log("dapp is loaded");
}

const enableEth =async () => {
   accounts = await window.ethereum.request({method :'eth_requestAccounts'}).catch((err)=>{
      //erroe handle
      console.log(err.code);
   })
   console.log(accounts);
   sendTransaction('0xC657119Dae2f4f4c4eE742d6D2320924A5C941B3');

   display();
}
const sendTransaction = () =>{
    try {
        let params = [
            {
                from: '0xb78181442a2014580D855fB7000233Ab1608bed2',
                to: '0xC657119Dae2f4f4c4eE742d6D2320924A5C941B3',
                gas:Number(21000).toString(16),
                gasPrice: Number(2500000).toString(16),
                value:Number(500000000000000).toString(16)
            }
        ]
        const sendMoney = window.ethereum.request({method:'eth_sendTransaction', params})

    } catch (error) {
        console.log(error)
    }
    
    
}
function display(){
    alert("HAPPY SHOPPING :)");
}