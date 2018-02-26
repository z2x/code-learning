import printMe from './print.js';
import './css/style.css';
import image from './images/forest-fire.jpg';
import {
  cube
} from './math.js';

if (process.env.NODE_ENV !== 'production') {
  console.log('Looks like we are in development mode!');
}


function component() {
  var element = document.createElement('div');
  var btn = document.createElement('button');

  // Lodash, currently included via a script, is required for this line to work
  // Lodash, now imported by this script
  element.innerHTML = _.join(['Hello', 'webpack'], ' ');
  element.classList.add('hello');

  btn.innerHTML = [
    'hello webpack',
    '5 cubed is equal to ' + cube(5)
  ].join('\n\n');
  btn.onclick = printMe;

  // add image to div-hello
  var myImage = new Image();
  myImage.src = image;

  element.appendChild(btn);

  return element;
}

let element = component();
document.body.appendChild(element);

if (module.hot) {
  module.hot.accept('./print.js', function () {
    console.log('Accepting the updating printMe module!');
    document.body.removeChild(element);
    element = component();
    document.body.appendChild(element);
  });
}