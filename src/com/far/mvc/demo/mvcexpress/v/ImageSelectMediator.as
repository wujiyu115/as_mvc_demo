package com.far.mvc.demo.mvcexpress.v
{
	import com.far.mvc.demo.common.view.ImageSelect;
	import com.far.mvc.demo.mvcexpress.Msg;
	import com.far.mvc.demo.robotlegs.models.vo.ImageVo;
	import flash.events.Event;
	import org.mvcexpress.mvc.Mediator;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageSelectMediator extends Mediator
	{
		[Inject]
		public var _view:ImageSelect;
		
		public function ImageSelectMediator()
		{
		
		}
		
		override public function onRegister():void
		{
			super.onRegister();
			addHandler(Msg.LOADXMLCOMPLETE, initData);
		}
		
		override public function onRemove():void
		{
			super.onRemove();
		}
		
		private function initData(data:Array):void
		{
			_view.removeAll();
			for (var i:int = 0; i < data.length; i++)
			{
				_view.addItem(data[i]);
			}
			_view.addEventListener(Event.SELECT, selectHandler);
		}
		private function selectHandler(e:Event):void
		{
			var image:ImageVo = _view.selectedItem as ImageVo;
			if (image)
				sendMessage(Msg.SENDURL, image.url);
		}
	
	}

}