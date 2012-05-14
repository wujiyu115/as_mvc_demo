package com.far.mvc.demo.robotlegs.mediators 
{
	import com.far.mvc.demo.common.view.ImageShow;
	import com.far.mvc.demo.robotlegs.events.ImageURlEvent;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageShowMediator extends Mediator 
	{
		[Inject]
		public var _imageShow:ImageShow;
		public function ImageShowMediator() 
		{
			
		}
		override public function onRegister():void 
		{
			 addContextListener(ImageURlEvent.URL, loadImage);
		}
		
		private function loadImage(e:ImageURlEvent):void 
		{
			_imageShow.url = e._data;
		}
		
	}

}