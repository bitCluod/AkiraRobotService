
"use strict";

let AnalogRead = require('./AnalogRead.js')
let ServoRead = require('./ServoRead.js')
let DigitalSetDirection = require('./DigitalSetDirection.js')
let DigitalRead = require('./DigitalRead.js')
let ServoWrite = require('./ServoWrite.js')
let DigitalWrite = require('./DigitalWrite.js')
let AnalogWrite = require('./AnalogWrite.js')

module.exports = {
  AnalogRead: AnalogRead,
  ServoRead: ServoRead,
  DigitalSetDirection: DigitalSetDirection,
  DigitalRead: DigitalRead,
  ServoWrite: ServoWrite,
  DigitalWrite: DigitalWrite,
  AnalogWrite: AnalogWrite,
};
