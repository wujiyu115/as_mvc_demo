package com.far.mvc.demo.robotlegs.commands
{
	import com.far.mvc.demo.robotlegs.events.ImageEvent;
	import flash.display.Sprite;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author far
	 */
	public class StartUpCommand extends Command
	{
		private var main:Main;
		
		override public function execute():void
		{
			
			main = contextView as Main;
			main.createImageSelect();
			main.createImageShow();
			//组件添加完成 
			dispatch(new ImageEvent(ImageEvent.ADDALLVIEW));
		}
	
	}

}