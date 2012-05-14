package com.far.mvc.demo.robotlegs.mediators 
{
	import com.far.mvc.demo.common.view.ImageSelect;
	import com.far.mvc.demo.robotlegs.events.ImageDataEvent;
	import com.far.mvc.demo.robotlegs.events.ImageURlEvent;
	import com.far.mvc.demo.robotlegs.models.vo.ImageVo;
	import flash.events.Event;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageSelectMediator extends Mediator 
	{
		[Inject]
		public var _imageSelect:ImageSelect;
		
		override public function onRegister():void 
		{
			addContextListener(ImageDataEvent.DATALOADCOMPLETE, initSelect);
			addViewListener(Event.SELECT, selectImageHandler);
		}
		
		private function initSelect(e:ImageDataEvent):void 
		{
			var data:Array = e._data;
			_imageSelect.removeAll();
			for (var i:int = 0; i < data.length; i++) 
			{
				_imageSelect.addItem (data[i]);
			}
		}
		
		private function selectImageHandler(e:Event):void 
		{
		    var image:ImageVo = _imageSelect.selectedItem as ImageVo;
			if(image)
			dispatch(new ImageURlEvent(ImageURlEvent.URL, image.url));
		}
		
	}

}