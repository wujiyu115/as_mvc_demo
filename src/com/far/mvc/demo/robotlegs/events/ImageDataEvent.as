package com.far.mvc.demo.robotlegs.events
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageDataEvent extends Event
	{
		public static const DATALOADCOMPLETE:String = "DATALOADCOMPLETE";
		public var _data:Array;
		public function ImageDataEvent(type:String, data:Array, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			this._data = data;
		}
		
		override public function clone():Event 
		{
			return new ImageDataEvent(type, _data, bubbles, cancelable);
		}
	
	}

}