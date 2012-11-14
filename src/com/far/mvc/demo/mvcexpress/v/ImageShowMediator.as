package com.far.mvc.demo.mvcexpress.v 
{
	import org.mvcexpress.mvc.Mediator;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageShowMediator extends Mediator 
	{
		
		public function ImageShowMediator() 
		{
			
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			trace("onRegister");
		}
		
		override public function onRemove():void 
		{
			super.onRemove();
		}
		
		
	}

}