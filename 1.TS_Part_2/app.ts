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

// Скоро дадим вам функцию, но она немного багонутая. 
// Попробуйте найти в ней все баги самостоятельно без запуска этого кода. 
// Когда вы увидели все баги и готовы их исправлять, то сделайте это (НО НЕ НАДО ПЕРЕПИСЫВАТЬ С НУЛЯ :)) ), 
// и когда будете уверены что функция работает ок - можете попробовать запустить ее и потестить. 
// Перед запуском изучите, что ваш любимый редактор подсвечивает в коде. 
// Нашел ли он какие-то ошибки?
// Если допустить, что все-таки вы пропустили ряд ошибок, то время протестировать тайпскрипт.

// 1) сложный этап. напишите нормальную тайпскриптовую сигнатуру функции 
// (отдельно опишите тип первого аргумента в виде interface)

// 2) если не получилось, смотрите спойлер: https://pastebin.com/2nEJvk04

// 3) пользуясь силой тайпскрипта и описанной сигнатуры, 
// найдите как можно больше ошибок, которых не нашли раньше. 
// По мере фикса кода, обнаруживайте еще ошибки на шару в процессе кодинга, 
// без запуска программы.
// результат скиньте @roman

// ... а вот и код багонутой функции:


type Values = string | number | BigObject | undefined

interface BigObject {
  [key: string]: { cvalue: Values } | undefined;
}


function sumCValue(objectCalc: BigObject) : number {
  const keysArr: number[] = Object.keys(objectCalc).map((currentKey) : number => {
    const currentElement = objectCalc[currentKey];


    if (typeof currentElement === 'undefined')  return 2021;
    if (currentElement && typeof currentElement.cvalue === 'string') return parseInt(currentElement.cvalue) || 2021;
    if (typeof currentElement.cvalue === 'number')  return currentElement.cvalue;
    if (currentElement.cvalue && isBigObject(currentElement.cvalue)) return sumCValue(currentElement.cvalue);
    return 0; // Added default return value
  });

  let sum:number = 0;
  for (let i = 0; i < keysArr.length; i++) {
    if (typeof keysArr[i] !== 'undefined'){
      sum += keysArr[i];
    }  
  }
  return sum;
}


function isBigObject(obj: any): obj is BigObject {
  // check if every key in the object has a property 'cvalue'
  return Object.values(obj).every(
    (value) => value !== null && typeof value === 'object' && 'cvalue' in value
  );
}

console.log("CValue: " + sumCValue({ hello: {cvalue: 1}, world: { cvalue: { yay: { cvalue: "2" } } } }))

// Напишите функцию mapObject, которая
// в чем-то очень похожа на функцию map для массивов.

// Эта функция должна принимать объект джаваскрипта
// и функцию transformer, которую нужно применить к каждому из полей того объекта, 
// ...а из результата применения функции transformer к каждому полю входящего объекта
// собрать новый объект и вернуть его.

// Так например можно будет замэппить объект типа 
// { "roma" : 5, "vasya": 2 } оценок студентов
// на функцию вроде (x) => x > 2
// чтобы получить объект 
// { "roma": true, "vasya": false } зачетов студентов

// Понятное дело для описания сигнатуры mapObject надо будет юзать
// 1) дженерики с несколькими параметрами-типами
// 2) такую штуку как Record (globalThis.Record, если быть точным ;))



function mapObject<K extends string|number|symbol,T,Y>(myObject: Record<K,T>, transformer: (key:T) => Y): Record<K,Y>{
  let result :Record<K,Y> = {} as Record<K,Y>;
  for (let key in myObject){
    result[key] = transformer(myObject[key])
  }
  return result;
}


console.log("mapObject: " + JSON.stringify(mapObject({ "roma" : 5, "vasya": 2 },(x) => x > 2)));



// Напишите функцию, которая принимает:
// 1) некие данные предполагаемо типа Т, но возможно не со всеми полями
// 2) функцию-дополнятор, которая принимает такие штуки как из п.1, 
//    а возвращает полноценный объект типа Т
// ... как вы поняли, саму функцию писать не надо :) 
// нас интересует только ее сигнатура.

function anyFunction1<T>(data: Partial<T>, addData: (data: Partial<T>) => T){
    return addData(data);
}

// Более сложный вариант:
// Напишите функцию, которая принимает:
// 1) некие данные предполагаемо типа Т (у которого поле id: string), 
//    но возможно без поля id
// 2) функцию-дополнятор, которая принимает такие штуки как из п.1, 
//    а возвращает полноценный объект типа Т
// ... как вы поняли, саму функцию писать не надо :) 
// нас интересует только ее сигнатура.

function anyFunction2<T extends {id?:string}>(data: Partial<T>, addData: (data: Partial<T>) => T){
  return addData(data);
}


// Последняя задача:
// Напишите сигнатуру функции, которая принимает
// - некий класс 
// - количество
// ...а возвращает массив экземпляров этого класса

class Rectangle {
  w!: number;
  h!: number;
}
class Circle {
  radius!: number;
}

// сделайте норм сигнатуру тут.
// НЕТ, Rectangle|Circle это не вариант, надо сделать универсальную функцию 
function наштамповать<T>(SOMECLASS: new () => T, count:number)  {
  let a = []
  for (let i = 0; i < count; i++)
     a.push(new SOMECLASS());
 
  return a;
}

let a: Rectangle[] = наштамповать(Rectangle, 10);
let b: Circle[] = наштамповать(Circle, 20)