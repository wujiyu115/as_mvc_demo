package com.far.mvc.demo.robotlegs.commands
{
	import com.far.mvc.demo.robotlegs.models.ImageModel;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author far
	 */
	public class AaddALLCommand extends Command
	{
		[Inject]
		public var _imageModel:ImageModel;
		
		override public function execute():void
		{
		  _imageModel.loadImageData();
		}
	
	}

}