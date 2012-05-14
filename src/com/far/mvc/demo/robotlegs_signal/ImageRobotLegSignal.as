package com.far.mvc.demo.robotlegs_signal 
{
	import com.far.mvc.demo.common.view.ImageSelect;
	import com.far.mvc.demo.common.view.ImageShow;
	import com.far.mvc.demo.robotlegs_signal.commands.AaddALLCommand;
	import com.far.mvc.demo.robotlegs_signal.commands.StartUpCommand;
	import com.far.mvc.demo.robotlegs_signal.mediators.ImageSelectMediator;
	import com.far.mvc.demo.robotlegs_signal.mediators.ImageShowMediator;
	import com.far.mvc.demo.robotlegs_signal.models.ImageModel;
	import com.far.mvc.demo.robotlegs_signal.signal.AddAllViewSignal;
	import com.far.mvc.demo.robotlegs_signal.signal.DataLoadCompleteSignal;
	import com.far.mvc.demo.robotlegs_signal.signal.ImageURLSiganl;
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalContext;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageRobotLegSignal extends SignalContext 
	{
		public function ImageRobotLegSignal(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}
		override public function startup():void 
		{
			injector.mapSingleton(ImageModel);
			injector.mapSingleton(DataLoadCompleteSignal);
			injector.mapSingleton(ImageURLSiganl);
			
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartUpCommand);
			
			signalCommandMap.mapSignalClass(AddAllViewSignal, AaddALLCommand);
			
			mediatorMap.mapView(ImageShow, ImageShowMediator);
			mediatorMap.mapView(ImageSelect, ImageSelectMediator);
			super.startup();
		}
		
	}

}