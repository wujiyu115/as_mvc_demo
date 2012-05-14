package com.far.mvc.demo.robotlegs_signal.mediators 
{
	import com.far.mvc.demo.common.view.ImageSelect;
	import com.far.mvc.demo.robotlegs.models.vo.ImageVo;
	import com.far.mvc.demo.robotlegs_signal.signal.DataLoadCompleteSignal;
	import com.far.mvc.demo.robotlegs_signal.signal.ImageURLSiganl;
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
		[Inject]
		public var loadComSignal:DataLoadCompleteSignal;
		[Inject]
		public var imageUrlSignal:ImageURLSiganl;
		
		override public function onRegister():void 
		{
			loadComSignal.add(initSelect);
			addViewListener(Event.SELECT, selectImageHandler);
		}
		
		private function initSelect(data:Array):void 
		{
			_imageSelect.removeAll();
			for (var i:int = 0; i < data.length; i++) 
			{
				_imageSelect.addItem (data[i]);
			}
		}
		
		private function selectImageHandler(e:Event):void 
		{
		    var image:ImageVo = _imageSelect.selectedItem as ImageVo;
			if (image)
			imageUrlSignal.dispatch( image.url);
		}
		
	}

}