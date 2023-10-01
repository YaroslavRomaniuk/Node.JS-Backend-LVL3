type DialogButtonType = "Yes" | "No";

interface FormButton {
    type: "Add" | "Remove" | "Buy"
}

// задача 1: создайте тип AnyButtonType, который описывает все вариации кнопок
type AnyButtonType = DialogButtonType | FormButton["type"]; // только без копипасты литералов, пожалуйста

const dialogButton: AnyButtonType = "Yes"; // Using DialogButtonType
const formButton: AnyButtonType = "Add"; // Using FormButton["type"]

// задача 2: создайте тип ConfirmationHandlingFormButton
// т.е. подтип формовых кнопок, которые ещё содержат поле onConfirm, в котором
// может лежать функция, которая вызывается с параметром типа DialogButtonType
// (и ничего не возвращает)
// Т.е. предполагается что у кнопки такого типа, если поле onConfirm пустое, 
// то при нажатии на эту кнопку сразу происходит действие
// а иначе вызывается диалог Подтверждения, и результат нажатия на кнопку Да или Нет
// в итоге попадет в функцию onConfirm, которая уже дальше решит что делать

type ConfirmationHandlingFormButton = {
  text: string;
  onClick: () => void;
  onConfirm?: (result: DialogButtonType) => void;
};


// .... НЕТ, не надо писать все эти диалоги формы кнопки, 
// мы описываем чисто типы сейчас.




// Есть функция. Она принимает некий объект А, у которого есть поля со значениями
// - или undefined 
// - или объекта с одним полем cvalue, который 
//      либо undefined 
//      либо по типу равный 
//           либо строке, 
//           либо числу, 
//           либо ссылке на объект по своей структуре/описанию подобный описываемому объекту А.
// ...Функция должна вернуть сумму "значений" поля cvalue всех полей объекта, притом,
// - если у очередного элемента поле сvalue - это число, 
//   то просто добавляем это число.
// - если у очередного элемента поле сvalue - это строка, 
//   то просто конвертим строку в число и добавляем.
// - если у очередного элемента поле cvalue - это объект подобный корневому, 
//   то добавляем сумму его полей (привет рекурсия)
// - если мы натыкаемся на undefined, или же если cvalue был строкой которая по факту не являлась адекватным числом - 
//   то тогда значением будет 2022.
  
// например, для { hello: {cvalue: 1}, world: { cvalue: { yay: { cvalue: "2" } } } } 
// должно вернуться 3

type Values = string|number|object|undefined


interface MyObject {
  [key:string]: Values | {cvalue:Values};
}



function calcCvalue (myObject: MyObject) {

  if (typeof(myObject.cvalue) === 'number'){
      console.log("its numbeeeeer!")
  } else if (typeof(myObject.cvalue) === 'string'){
      console.log('strrrrrriiiing')
  }

}