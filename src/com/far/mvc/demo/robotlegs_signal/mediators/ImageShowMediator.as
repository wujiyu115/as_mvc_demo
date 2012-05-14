package com.far.mvc.demo.robotlegs_signal.mediators 
{
	import com.far.mvc.demo.common.view.ImageShow;
	import com.far.mvc.demo.robotlegs_signal.signal.ImageURLSiganl;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageShowMediator extends Mediator 
	{
		[Inject]
		public var _imageShow:ImageShow;
		[Inject]
		public var imageUrlSignal:ImageURLSiganl;
		public function ImageShowMediator() 
		{
			
		}
		override public function onRegister():void 
		{
			 imageUrlSignal.add(loadImage);
		}
		
		private function loadImage(url:String):void 
		{
			_imageShow.url = url;
		}
		
	}

}