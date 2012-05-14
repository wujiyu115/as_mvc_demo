package com.far.mvc.demo.robotlegs 
{
	import com.far.mvc.demo.robotlegs.commands.AaddALLCommand;
	import com.far.mvc.demo.robotlegs.commands.StartUpCommand;
	import com.far.mvc.demo.robotlegs.mediators.ImageSelectMediator;
	import com.far.mvc.demo.robotlegs.mediators.ImageShowMediator;
	import com.far.mvc.demo.robotlegs.events.ImageEvent;
	import com.far.mvc.demo.robotlegs.models.ImageModel;
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import com.far.mvc.demo.common.view.ImageSelect;
	import com.far.mvc.demo.common.view.ImageShow;
	/**
	 * ...
	 * @author far
	 */
	public class ImageShowContext extends Context 
	{
		public function ImageShowContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
	    override public function startup():void 
		{
			injector.mapSingleton(ImageModel);
			
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartUpCommand);
			commandMap.mapEvent(ImageEvent.ADDALLVIEW, AaddALLCommand);
			
			
			mediatorMap.mapView(ImageShow, ImageShowMediator);
			mediatorMap.mapView(ImageSelect, ImageSelectMediator);
			super.startup();
		}
		
	}

}