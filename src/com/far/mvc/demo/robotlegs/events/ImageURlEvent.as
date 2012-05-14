package com.far.mvc.demo.robotlegs.events
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageURlEvent extends Event
	{
		
		public static const URL:String = "URL";
		public var _data:String;
		public function ImageURlEvent(type:String, data:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			this._data = data;
		}
		
		override public function clone():Event
		{
			return new ImageURlEvent(type, _data, bubbles, cancelable);
		}
	
	}

}