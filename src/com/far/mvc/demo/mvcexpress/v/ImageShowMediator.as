package com.far.mvc.demo.mvcexpress.v 
{
	import com.far.mvc.demo.common.view.ImageShow;
	import com.far.mvc.demo.mvcexpress.Msg;
	import org.mvcexpress.mvc.Mediator;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageShowMediator extends Mediator 
	{
		[Inject]
		public var _view:ImageShow;
		public function ImageShowMediator() 
		{
			
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			addHandler(Msg.SENDURL, setUrl);
		}
		
		override public function onRemove():void 
		{
			super.onRemove();
		}
		
		private function  setUrl(url:String):void {
			_view.url = url;
		}
		
		
	}

}