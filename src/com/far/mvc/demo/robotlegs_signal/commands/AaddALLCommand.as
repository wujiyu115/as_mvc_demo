package com.far.mvc.demo.robotlegs_signal.commands
{
	import com.far.mvc.demo.robotlegs_signal.models.ImageModel;
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * ...
	 * @author far
	 */
	public class AaddALLCommand extends SignalCommand
	{
		[Inject]
		public var _imageModel:ImageModel;
		
		override public function execute():void
		{
		  _imageModel.loadImageData();
		}
	
	}

}