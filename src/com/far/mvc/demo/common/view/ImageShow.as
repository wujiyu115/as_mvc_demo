package com.far.mvc.demo.common.view 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageShow extends Sprite 
	{
		private var _loader:Loader;
		private var _url:String;
		public function ImageShow() 
		{
			_loader = new Loader();
			//_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadOverHandler);
			 this.addChild(_loader);
		}
		
 
		public function set url(value:String):void 
		{
			_url = value;
			if (_loader)
			    _loader.unloadAndStop();
			_loader.load(new URLRequest(value));
		}
		
	}

}