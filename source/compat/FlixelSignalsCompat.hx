package compat;

#if (flixel)
import flixel.FlxG;

// Put our typedef in the SAME package Flixel used to expose it from,
// so existing imports continue to work without touching all call sites.
package flixel.util;

// Newer Flixel removed FlxTypedSignal. We alias it to FlxSignal so old code compiles.
typedef FlxTypedSignal = FlxSignal;

#end
