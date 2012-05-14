package com.far.mvc.demo.robotlegs.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageEvent extends Event 
	{
		public static const ADDALLVIEW:String = "ADDALLVIEW";
		public function ImageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type,bubbles,cancelable);
		}
		 
	}

}