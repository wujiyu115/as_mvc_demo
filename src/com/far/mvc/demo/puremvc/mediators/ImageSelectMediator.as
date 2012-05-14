package com.far.mvc.demo.puremvc.mediators
{
	import com.far.mvc.demo.common.view.ImageSelect;
	import com.far.mvc.demo.puremvc.enums.ApplicationEvent;
	import com.far.mvc.demo.robotlegs.models.vo.ImageVo;
	import flash.events.Event;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageSelectMediator extends Mediator
	{
		public static const NAME:String = 'ImageSelectMediator';
		
		public function ImageSelectMediator(viewComponent:Object = null)
		{
			super(NAME, viewComponent);
		}
		
		override public function listNotificationInterests():Array
		{
			return [ApplicationEvent.LOADCOMPLETE];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case ApplicationEvent.LOADCOMPLETE: 
					initSelect(notification.getBody() as Array);
					imageSelect.addEventListener(Event.SELECT, selectImageHandler);
					break;
			
			}
		}
		
		private function selectImageHandler(e:Event):void
		{
			var image:ImageVo = imageSelect.selectedItem as ImageVo;
			if (image)
				sendNotification(ApplicationEvent.SENDURL, image.url);
		}
		
		private function initSelect(data:Array):void
		{
			imageSelect.removeAll();
			for (var i:int = 0; i < data.length; i++)
			{
				imageSelect.addItem(data[i]);
			}
		}
		
		public function get imageSelect():ImageSelect
		{
			return viewComponent as ImageSelect;
		}
	}

}