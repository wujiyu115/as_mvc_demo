package com.far.mvc.demo.puremvc 
{
	import com.far.mvc.demo.puremvc.commands.StartUpCommand;
	import com.far.mvc.demo.puremvc.enums.ApplicationEvent;
	import org.puremvc.as3.patterns.facade.Facade;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageFacade extends Facade 
	{
		
		public static function getInstance() : ImageFacade {
			if (instance == null) {
				instance = new ImageFacade();
			}
			return instance as ImageFacade;
		}

		override protected function initializeController():void 
		{
			super.initializeController();
			registerCommand(ApplicationEvent.STARTUP, StartUpCommand);
		}
		
	 
		public function startUp(app:*):void {
		   sendNotification(ApplicationEvent.STARTUP, app);	
		}
	}

}