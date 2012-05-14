package com.far.mvc.demo.common.view 
{
	import com.bit101.components.ComboBox;
	import flash.display.DisplayObjectContainer;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageSelect extends ComboBox 
	{
		 public function ImageSelect(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0, defaultLabel:String="", items:Array = null)
		{
			super(parent, xpos, ypos,defaultLabel,items);
		}
	}

}