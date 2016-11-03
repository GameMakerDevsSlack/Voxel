///getSliderPositionFromValue(slider, value)
/*
        This script takes in a slider object, and a value and returns the x-position of the slider
*/
var percent = (argument1 - argument0.valueMIN) / (argument0.valueMAX - argument0.valueMIN);
return percent * argument0.sliderWidth;