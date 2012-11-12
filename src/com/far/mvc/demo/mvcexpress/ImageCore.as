package com.far.mvc.demo.mvcexpress 
{
	import com.far.mvc.demo.mvcexpress.c.StartUpCommand;
	import org.mvcexpress.core.ModuleCore;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageCore extends ModuleCore 
	{
		
		public function ImageCore() 
		{
			super();
			
		}
		
		override protected function onInit():void 
		{
			super.onInit();
		     commandMap.map(Msg.START_UP, StartUpCommand);
		}
		
		public function  start(main:Object):void {
             sendMessage(Msg.START_UP, main);
		}
	}

}