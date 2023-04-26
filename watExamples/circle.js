const canvas = document.getElementById('c');
const ctx = canvas.getContext('2d');
const x = 100;
const y = 100;
const radius = 50;

ctx.beginPath();
ctx.arc(x, y, radius, 0, 2 * Math.PI);
ctx.stroke();
