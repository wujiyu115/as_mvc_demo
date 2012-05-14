package com.far.mvc.demo.puremvc.mediators
{
	import com.far.mvc.demo.common.view.ImageShow;
	import com.far.mvc.demo.puremvc.enums.ApplicationEvent;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageShowMediator extends Mediator
	{
		
		public static const NAME:String = 'ImageShowMediator';
		
		public function ImageShowMediator(viewComponent:Object = null)
		{
			super(NAME, viewComponent);
		}
		
		override public function listNotificationInterests():Array
		{
			return [ApplicationEvent.SENDURL];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case ApplicationEvent.SENDURL: 
					imageShow.url = notification.getBody().toString();
					break;
			
			}
		}
		
		public function get imageShow():ImageShow
		{
			return viewComponent as ImageShow;
		}
	}

}